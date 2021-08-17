[![Build Status](https://www.travis-ci.com/vantage-sh/vantage-ruby.svg?branch=main)](https://www.travis-ci.com/vantage-sh/vantage-ruby)

# Vantage Ruby Client

![Vantage Picture](https://uploads-ssl.webflow.com/5f9ba05ba40d6414f341df34/5f9bb1764b6670c6f7739564_moutain-scene.svg)


[Vantage](http://vantage.sh/) is a cloud cost transparency platform. This is the official Ruby client for the [Vantage API](http://vantage.readme.io/). You can use the API to get EC2 instance price and product information through a few simple-to-use API calls. The data offered through this API is heavily inspired from data avaiable from [ec2instances.info](http://ec2instances.info/). The feedback we get from users is that this API is significantly easier than learning and using AWS Pricing APIs. We have plans to expand the data available through this API in the future.

## Need Help?

Feel free to join us in our [community Slack](https://join.slack.com/t/vantagecommunity/shared_invite/zt-oey52myv-gq4AWRKkX25kjp1UGziPTw) in the #api channel. We're happy to chat and help. You're also welcome to email support@vantage.sh or ping [@JoinVantage](https://twitter.com/joinvantage) on Twitter and we're happy to give assistance. Lastly, we monitor issues on this repo if you have any feature requests or issues. 

## Installation

The easiest way to get going is to install the client through RubyGems:

```shell
gem install vantage-client
```

## Generate a Free API Token
The Vantage API is provided completely for free but requires an API token to use. To generate a free API token, follow these steps:

* Head to [http://vantage.sh/](http://vantage.sh/)
* Register a free account and confirm your email
* When you're asked _"What would you like to do first?"_ click _"Access Cloud Pricing API"_
* Create an API token from the account profile page and you're all set

You'll only need to do this once and you can use your API token for all usage going forward. 

## API Primitives

The Vantage API is currently organized into four different primitives. Understanding the relationships between these primitives will be helpful as you onboard to the API. Since Vantage only supports EC2 on AWS at the moment, this is provided mainly to show how we are looking at support for future data:

* **Providers**: Providers are the highest level API Primitive. A Provider represents either cloud infrastructure provider or a cloud service provider. Some examples of Providers include AWS, GCP or Azure. Providers offer many Services, which is documented below.
* **Services**: Services are what Providers offer to their customers. A Service is always tied to a Provider. Some examples of Services are EC2 or S3 from a Provider of AWS. A Service has one or more Products offered, which is documented below.
* **Products**: Products are what Services ultimately price on. Using the example of a Provider of 'AWS' and a Service of 'EC2', Products would be the individual EC2 Instance Types available such as 'm5d.16xlarge' or 'c5.xlarge'. A Product has one or more Prices, which is documented below.
* **Prices**: A Product has one or more Prices available to it. For example with EC2 instance types, a single instance type may have potential prices including an on-demand price, a spot price or a reserved instance price.


## Getting Started

Once you've installed the client, you'll want to confirm your API token is working correctly. We offer a "ping" endpoint for testing this and overall API healthiness:

```ruby
# Load the gem
require 'vantage-client'

# Configure Vantage with your API token. Replace "YOUR_API_TOKEN" with the token you generate. 
Vantage.configure do |config|
  config.access_token = 'YOUR_API_TOKEN'
end

api_instance = Vantage::CostsApi.new

report_id = 'report_id_example' # String | 

opts = { 
  start_date: 'start_date_example', # String | Query costs by the first date you would like to filter from. ISO 8601 Formatted - 2021-07-15 or 2021-07-15T19:20:48+00:00.
  end_date: 'end_date_example' # String | Query costs by the last date you would like to filter to. ISO 8601 Formatted - 2021-07-15 or 2021-07-15T19:20:48+00:00.
}

begin
  result = api_instance.get_costs(report_id, opts)
  p result
rescue Vantage::ApiError => e
  puts "Exception when calling CostsApi->get_costs: #{e}"
end
```

## Getting EC2 Instance Information

Getting EC2 instance product information is one of the most used functions of the API. Here's an example of how to get product information for a c5.xlarge EC2 instance:

```ruby

# Load the gem
require 'vantage-client'

# Configure Vantage with your API token. Replace "YOUR_API_TOKEN" with the token you generate. 
Vantage.configure do |config|
  config.access_token = 'YOUR_API_TOKEN'
end

# The Vantage::PricesApi class helps get simple information 
vantage_client = Vantage::PricesApi.new

# Find all instances with the instance type name of 'c5.xlarge'
response = vantage_client.get_products(name: 'c5.xlarge')

# See the entire response
puts response.products.first
# { 
#   :id=>"aws-ec2-c5_xlarge", 
#   :category=>"compute", 
#   :name=>"c5.xlarge", 
#   :service_id=>"aws-ec2", 
#   :provider_id=>"aws", 
#   :details=>{
#     :gpu=>0, 
#     :name=>"C5 High-CPU Extra Large", 
#     :vcpu=>4, 
#     :memory=>8.0, 
#     :storage=>nil, 
#     :clock_speed_ghz=>3.0, 
#     :physical_processor_description=>"Intel Xeon Platinum 8124M", 
#     :network_performance_description=>"Up to 10 Gigabit"
#   }
# }

```

## Getting EC2 Instance Pricing

Getting the price of an EC2 instance is also easy to do. Here's an example of how to get the price for a c5.xlarge. You'll need the product ID from the prior call to retrive prices. Note that Vantage will return all prices across all regions, platforms and lifecycle so client-side you'll want to filter for the appropriate region, platform and lifecycle.

The price returned in the example below will give you the **on-demand** price for a **linux** EC2 instance in **us-east-1**.

```ruby 

# Load the gem
require 'vantage-client'

# Configure Vantage with your API token.  Replace "YOUR_API_TOKEN" with the token you generate. 
Vantage.configure do |config|
  config.access_token = 'YOUR_API_TOKEN'
end

# The Vantage::PricesApi class helps get simple information 
vantage_client = Vantage::PricesApi.new

# Find all prices using the product ID returned in the previous example
# Note that this will return all prices across all regions and platform types by default.
response = vantage_client.get_prices('aws-ec2-c5_xlarge')

puts response.prices.first
# {
#   :id=>"aws-ec2-c5_xlarge-us_east_1-on_demand-linux", 
#   :unit=>"hour", 
#   :region=>"us-east-1", 
#   :rate_type=>"compute", 
#   :currency=>"USD", 
#   :amount=>0.17, 
#   :details=>{
#     :platform=>"linux", 
#     :lifecycle=>"on-demand"
#   }
# }
```

## Documentation for Models

 - [Vantage::Cost](docs/Cost.md)
 - [Vantage::Costs](docs/Costs.md)
 - [Vantage::Price](docs/Price.md)
 - [Vantage::Prices](docs/Prices.md)
 - [Vantage::Product](docs/Product.md)
 - [Vantage::Products](docs/Products.md)
 - [Vantage::Provider](docs/Provider.md)
 - [Vantage::Providers](docs/Providers.md)
 - [Vantage::Report](docs/Report.md)
 - [Vantage::Reports](docs/Reports.md)
 - [Vantage::Service](docs/Service.md)
 - [Vantage::Services](docs/Services.md)

