# MWS Orders

[![CircleCI](https://circleci.com/gh/hakanensari/mws-orders.svg?style=svg)](https://circleci.com/gh/hakanensari/mws-orders)

**MWS Orders** is a full-featured Ruby interface to the [Amazon Marketplace Web Service (MWS) Orders API](http://docs.developer.amazonservices.com/en_UK/orders/index.html). With the MWS Orders API, you can list orders created or updated during a time frame you specify or retrieve information about specific orders.

To use Amazon MWS, you must have an eligible seller account.

## Usage

Create a client:

```ruby
require 'mws/orders/parser'
client = MWS.orders(marketplace: 'ATVPDKIKX0DER',
                    merchant_id: '123')
```

Set up credentials [when instantiating or with environment variables](https://github.com/hakanensari/peddler#usage).

### Orders

List orders created or updated during a time frame you specify:

```ruby
response = client.list_orders(created_after: 1.month.ago)
orders = response.parse
puts orders.count # => 100
orders.first.inspect # => #<MWS::Orders::Order 902-3159896-1390916>
)
```

List the next page of orders:

```ruby
client.list_orders_by_next_token(orders.next_token).parse
```

Get one or more orders based on their order numbers:

```ruby
response = client.get_order('902-3159896-1390916')
order = response.parse
order.inspect # => #<MWS::Orders::Order 902-3159896-1390916>
```

### Order Items

List order items:

```ruby
response = client.list_order_items('902-3159896-1390916')
order_items = response.parse
```

List the next page of order items:

```ruby
client.list_order_items_by_next_token.parse
```

Orders and order items are represented by POROs that map one on one to the attributes returned by the API.

### Service Status

Check the operational status of the API:

```ruby
client.get_service_status.parse
```
