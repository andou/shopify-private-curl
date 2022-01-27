#!/bin/bash

print_header() {
    sep
    printf "${LCYAN}SCOPES CHECKER${NC}\n"
    printf "${LCYAN}-- Checks the scopes for the token currently in use${NC}\n"
    printf "${LCYAN}-- @see https://shopify.dev/api/admin-rest/2021-10/resources/accessscope for more information ${NC}\n"
    sep
}

the_call(){
    OUT=$(curl -s -X GET "https://${DOMAIN}.myshopify.com/admin/oauth/access_scopes.json" \
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

while getopts 'vjhq:' flag; do
  case "${flag}" in
    j) USE_JQ="true" ;;
    v) VERBOSE="true" ;;
    q) JQ_CLI="${OPTARG}" ;;
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