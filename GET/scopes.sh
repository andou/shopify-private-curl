#!/bin/bash

print_header() {
    sep
    printf "${LCYAN}SCOPES CHECKER${NC}\n"
    printf "${LCYAN}-- Checks the scopes for the token currently in use${NC}\n"
    printf "${LCYAN}-- @see https://shopify.dev/api/admin-rest/2021-10/resources/accessscope for more information ${NC}\n"
    sep
}

the_call(){

    if [ "$PRINT_COMMAND" = "true" ]; then
        printf "${GREEN}Issue this from the command line:${NC}\n"
        echo 'curl -s -X GET "https://'$DOMAIN'.myshopify.com/admin/oauth/access_scopes.json" \
    -H "X-Shopify-Access-Token: '$TOKEN'"'
    else
        OUT=$(curl -s -X GET "https://${DOMAIN}.myshopify.com/admin/oauth/access_scopes.json" \
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