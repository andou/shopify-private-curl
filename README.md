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
And edit it with the right domain and the access token
```
TOKEN="shppa_access_token"
DOMAIN="your-development-store"
```

## Usage
Basically, each scripts works in conjunction with these flags:
```
    -j  Utilizza jq in pipe
    -q  Insieme con il flag -j per specificare il filtro jq
```
`-j` to pipe with jq, if installed and `-q` to specify the jq filter, when in use.

## Examples

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

### Order Fulfillment list
GET all the information for a single order
```
./GET/fulfillment.sh -j -o 4666765607132
```