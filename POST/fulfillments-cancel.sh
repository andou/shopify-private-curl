#!/bin/bash

print_header() {
    sep
    printf "${LCYAN}ORDER FULFILLMENT CREATOR${NC}\n"
    printf "${LCYAN}-- Fetches a list of fulfillments${NC}\n"
    printf "${LCYAN}-- @see https://shopify.dev/api/admin-rest/2022-01/resources/fulfillment for more information ${NC}\n"
    sep
}

the_call(){
    PACKAGE='{}'

    if [ "$PRINT_COMMAND" = "true" ]; then
        printf "${GREEN}Issue this from the command line:${NC}\n"
        echo 'curl -s -d '$PACKAGE' \
-X POST "https://'$DOMAIN'.myshopify.com/admin/api/2021-10/orders/'$THE_ORDER'/fulfillments/'$THE_FULFILLMENT'/cancel.json" \
-H "X-Shopify-Access-Token: '$TOKEN'" -H "Content-Type: application/json"'
    else
        OUT=$(curl -s -d ${PACKAGE} \
-X POST "https://${DOMAIN}.myshopify.com/admin/api/2021-10/orders/${THE_ORDER}/fulfillments/${THE_FULFILLMENT}/cancel.json" \
-H "X-Shopify-Access-Token: ${TOKEN}" -H "Content-Type: application/json") 
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
. ./commons/input/order-fulfillment.sh
###################################

############# OUTPUT ##############
. ./commons/output/simple.sh
###################################