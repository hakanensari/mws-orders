# MWS Orders

[![Build Status](https://travis-ci.org/hakanensari/mws-orders.svg)](https://travis-ci.org/hakanensari/mws-orders)

**MWS Orders** is a full-featured Ruby interface to the [Amazon Marketplace Web Service (MWS) Orders API](http://docs.developer.amazonservices.com/en_UK/orders/index.html). With the MWS Orders API, you can list orders created or updated during a time frame you specify or retrieve information about specific orders.

To use Amazon MWS, you must have an eligible seller account.

## Usage

Create a client:

```ruby
require "mws-orders"
client = MWS.orders
```

Set up credentials [when instantiating or with environment variables](https://github.com/hakanensari/peddler#quick-start).

### Orders

List orders created or updated during a time frame you specify:

```ruby
response = client.list_orders(created_after: 1.month.ago)
orders = response.parse
puts orders.count # => 100
puts orders.first # => #<MWS::Orders::Order amazon_order_id="123...
)
```

List the next page of orders:

```ruby
client.list_orders_by_next_token(orders.next_token).parse
```

Get one or more orders based on their order numbers:

```ruby
response = client.get_order("123-1234567-1234567")
order = response.parse
puts order # => #<MWS::Orders::Order amazon_order_id="123...
```

### Order Items

List order items:

```ruby
response = client.list_order_items("123-1234567-1234567")
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
