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