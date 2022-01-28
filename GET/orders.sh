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
    OUT=$(curl -s -X GET "https://${DOMAIN}.myshopify.com/admin/api/2021-10/orders.json?status=any" \
    -H "X-Shopify-Access-Token: ${TOKEN}")
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