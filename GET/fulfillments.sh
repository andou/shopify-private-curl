#!/bin/bash

print_header() {
    sep
    printf "${LCYAN}ORDER FULFILLMENT FETCHER${NC}\n"
    printf "${LCYAN}-- Fetches a list of fulfillments${NC}\n"
    printf "${LCYAN}-- @see https://shopify.dev/api/admin-rest/2022-01/resources/fulfillment for more information ${NC}\n"
    sep
}

the_call(){
    if [ "$PRINT_COMMAND" = "true" ]; then
        printf "${GREEN}Issue this from the command line:${NC}\n"
        echo 'curl -s -X GET "https://'$DOMAIN'.myshopify.com/admin/api/2021-10/orders/'$THE_ORDER'/fulfillments.json" \
    -H "X-Shopify-Access-Token: '$TOKEN'"'
    else
        OUT=$(curl -s -X GET "https://${DOMAIN}.myshopify.com/admin/api/2021-10/orders/${THE_ORDER}/fulfillments.json" \
        -H "X-Shopify-Access-Token: ${TOKEN}")
    fi
}

###########################################

##### READING CONFIGURATIONS #####
. ./commons/readconfs.sh
###################################

######## OUTPUT FUNCTIONS #########
. ./commons/output/functions.sh
###################################

############# INPUT ###############
. ./commons/input/order.sh
###################################

############# OUTPUT ##############
. ./commons/output/simple.sh
###################################