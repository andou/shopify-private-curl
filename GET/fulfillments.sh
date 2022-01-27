#!/bin/bash

print_header() {
    sep
    printf "${LCYAN}ORDER FULFILLMENT FETCHER${NC}\n"
    printf "${LCYAN}-- Fetches a list of fulfillments${NC}\n"
    printf "${LCYAN}-- @see https://shopify.dev/api/admin-rest/2022-01/resources/fulfillment for more information ${NC}\n"
    sep
}

the_call(){
    OUT=$(curl -s -X GET "https://${DOMAIN}.myshopify.com/admin/api/2021-10/orders/${THE_ORDER}/fulfillments.json" \
    -H "X-Shopify-Access-Token: ${TOKEN}")
}

###########################################

sep() {
    printf "###################################\n"
}

output(){
if [ "$USE_JQ" = "true" ]; then
    echo $OUT | jq "$JQ_CLI"
else
    echo $OUT
fi
}

print_usage() {
  cat << "EOF"
    OPTIONS
        -h  Stampa questo help
        -o  ID dell'ordine da recuperare
        -v  Modalità verbosa
        -j  Utilizza jq in pipe
        -q  Insieme con il flag -j per specificare il filtro jq
EOF
}

##### READING CONFIGURATIONS #####
CONF_FILE=./confs/shp.cnf
. ./confs/colors.cnf
if [ ! -f "$CONF_FILE" ]; then
    printf "${RED}ERROR${NC} Missing ${CONF_FILE} configuration file\n"
    exit 1
fi
. $CONF_FILE
###################################


JQ_CLI=''
THE_ORDER=''

while getopts 'vjhq:o:' flag; do
  case "${flag}" in
    j) USE_JQ="true" ;;
    v) VERBOSE="true" ;;
    q) JQ_CLI="${OPTARG}" ;;
    o) THE_ORDER="${OPTARG}" ;;
    h) print_usage
       exit 1 ;;
    *) print_usage
       exit 1 ;;
  esac
done

if [ "$VERBOSE" = "true" ]; then
    print_header
fi

the_call
output
exit 0