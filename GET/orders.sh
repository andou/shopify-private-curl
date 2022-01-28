#!/bin/bash


#####################################################################################################################

print_header() {
    sep
    printf "${LCYAN}ORDERS FETCHER${NC}\n"
    printf "${LCYAN}-- Fetches orders${NC}\n"
    printf "${LCYAN}-- @see https://shopify.dev/api/admin-rest/2021-10/resources/order for more information ${NC}\n"
    sep
}

the_call(){
    if [ "$PRINT_COMMAND" = "true" ]; then
        printf "${GREEN}Issue this from the command line:${NC}\n"
        echo 'curl -s -X GET "https://'$DOMAIN'.myshopify.com/admin/api/2021-10/orders.json?status=any" \
    -H "X-Shopify-Access-Token: '$TOKEN'"'
    else
        OUT=$(curl -s -X GET "https://${DOMAIN}.myshopify.com/admin/api/2021-10/orders.json?status=any" \
    -H "X-Shopify-Access-Token: ${TOKEN}")
    fi
}

#####################################################################################################################

##### READING CONFIGURATIONS #####
. ./commons/readconfs.sh
###################################

######## OUTPUT FUNCTIONS #########
. ./commons/output/functions.sh
###################################

############# INPUT ###############
. ./commons/input/simple.sh
###################################

############# OUTPUT ##############
. ./commons/output/simple.sh
###################################