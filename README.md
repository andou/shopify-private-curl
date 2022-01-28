### Shopify Private App Services Samples

A set of sample calls against [Shopify REST Admin APIs](https://shopify.dev/api/admin-rest).

## Prerequisites
You'll need:
- A UNIX / Linux environment to run bin/bash scripts.
- The [curl utility](https://curl.se/)
- [git](https://git-scm.com/)

Optionally, you may consider to install [jq](https://stedolan.github.io/jq/) to squeeze, transform and manipulate the output.

## Installation

```
git clone git@github.com:andou/shopify-private-curl.git
```

## Configuration

Create the config file copying it from the sample
```
cp confs/shp.cnf.sample confs/shp.cnf
```
And edit it with the right domain, access token and location id for fulfillments
```
TOKEN="shppa_access_token"
DOMAIN="your-development-store"
LOCATION_ID="your-default-logistic-headquarter"
```

## Usage
Basically, each scripts works in conjunction with these flags:
```
    -j  Utilizza jq in pipe
    -q  Insieme con il flag -j per specificare il filtro jq
    -p  Stampa a video il comando curl da eseguire
```
`-j` to pipe with jq, if installed and `-q` to specify the jq filter, when in use.

Some scripts will need some other IDs in input. In any case a `-h` flag should tells you the right usage.

In any case, a `-p` flag will not execute the curl but prints it on the screen. Which could be useful to make calls in other circumnstances.

## Shopify Documentation

### Orders
- [Retrieve a list of orders](https://shopify.dev/api/admin-rest/2021-10/resources/order#[get]/admin/api/2021-10/orders.json?status=any)
- [Retrieve a specific order](https://shopify.dev/api/admin-rest/2021-10/resources/order#[get]/admin/api/2021-10/orders/{order_id}.json)

### Fulfillments
- [Retrieves a list of fulfillment orders for a specific order](https://shopify.dev/api/admin-rest/2021-10/resources/fulfillmentorder#[get]/admin/api/2021-10/orders/{order_id}/fulfillment_orders.json)
- [Create a new Fulfillment](https://shopify.dev/api/admin-rest/2021-10/resources/fulfillment#[post]/admin/api/2021-10/orders/{order_id}/fulfillments.json)
- [Cancel a fulfillment for a specific order ID](https://shopify.dev/api/admin-rest/2021-10/resources/fulfillment#[post]/admin/api/2021-10/orders/{order_id}/fulfillments/{fulfillment_id}/cancel.json)

## Examples

### Curl commands

Here's a brief summary of the `curl` commands you may want to check

All the orders [API Reference](https://shopify.dev/api/admin-rest/2021-10/resources/order#[get]/admin/api/2021-10/orders.json?status=any)
```
./GET/orders.sh -p
```

Retrieve a specific order [API Reference](https://shopify.dev/api/admin-rest/2021-10/resources/order#[get]/admin/api/2021-10/orders/{order_id}.json)
```
./GET/order.sh -p -o 4666764525788
```

Specific order fulfillments list [API Reference](https://shopify.dev/api/admin-rest/2021-10/resources/fulfillmentorder#[get]/admin/api/2021-10/orders/{order_id}/fulfillment_orders.json)
```
./GET/fulfillments.sh -p -o 4666764525788
```

Create an order fulfillment [API Reference](https://shopify.dev/api/admin-rest/2021-10/resources/fulfillment#[post]/admin/api/2021-10/orders/{order_id}/fulfillments.json)
```
./POST/fulfillments-create.sh -p -o 4666764525788
```

Cancel an order fulfillment [API Reference](https://shopify.dev/api/admin-rest/2021-10/resources/fulfillment#[post]/admin/api/2021-10/orders/{order_id}/fulfillments/{fulfillment_id}/cancel.json)
```
./POST/fulfillments-cancel.sh -p -o 4666764525788 -f 4166735724764
```

### Orders

GET all the orders
```
./GET/orders.sh -j
```

GET all the orders IDs
```
./GET/orders.sh -j -q '.orders[] | {id}'
```

GET a short summary for all the orders
```
./GET/orders.sh -j -q '.orders[] | {id,created_at,updated_at,financial_status,fulfillment_status,confirmed,closed_at,total_price,currency,customer:{email: .customer.email,name:"\(.customer.first_name) \(.customer.last_name)"}}'
```

### Single Order
GET all the information for a single order
```
./GET/order.sh -j -o 4666765607132
```

GET a short summary for a single order
```
./GET/order.sh -j -o 4666765607132 -q '.order | {id,created_at,updated_at,financial_status,fulfillment_status,confirmed,closed_at,total_price,currency,customer:{email: .customer.email,name:"\(.customer.first_name) \(.customer.last_name)"}}'
```

### Order fulfillment list
GET all the fulfillments for a given order
```
./GET/fulfillments.sh -o 4666764525788 -j
```
GET all the IDs and statuses for a given order
```
./GET/fulfillments.sh -o 4666764525788 -j -q '.fulfillments[] | {id,order_id,status}'
```

### Create or cancel an order fulfillment
Fullfill all the items for a given order
```
./POST/fulfillments-create.sh -o 4666764525788 -j
```
Cancel a given fullfillment for a given order
```
./POST/fulfillments-cancel.sh -o 4666764525788 -f 4166735724764 -j
```