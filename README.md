# MWS Orders

A Ruby interface to the Amazon MWS Orders API

![peddler][1]

## Usage

Start by instantiating a client:

```ruby
client = MWS::Orders::Client.new('GB', 'aws_key', 'aws_secret', 'seller_id')
```

API methods are available on the client.

### Orders

The following return an enumerable list of orders.

```ruby
client.list_orders(created_after: 1.week.ago)
client.list_orders_by_next_token
client.get_order('123-1234567-1234567')
```

### Order Items

The following return an enumerable list of order items.

```ruby
client.list_order_items('123-1234567-1234567')
client.list_order_items_by_next_token
```

### Service Status

The following returns the service status of the API.

```ruby
client.get_service_status
```

Check the [API docs][2] for further detail.

[1]: http://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Peddler%2C%E8%A1%8C%E5%95%86%E4%BA%BA%E3%80%81PB300529.JPG/512px-Peddler%2C%E8%A1%8C%E5%95%86%E4%BA%BA%E3%80%81PB300529.JPG
[2]: http://docs.developer.amazonservices.com/en_UK/orders/index.html
