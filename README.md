# vantage-client

Vantage - the Ruby gem for the Vantage

Vantage API

This SDK is automatically generated by the [Swagger Codegen](https://github.com/swagger-api/swagger-codegen) project:

- API version: 1.0.0
- Package version: 0.0.5
- Build package: io.swagger.codegen.languages.RubyClientCodegen
For more information, please visit [https://www.vantage.sh](https://www.vantage.sh)

## Installation

### Build a gem

To build the Ruby code into a gem:

```shell
gem build vantage-client.gemspec
```

Then either install the gem locally:

```shell
gem install ./vantage-client-0.0.5.gem
```
(for development, run `gem install --dev ./vantage-client-0.0.5.gem` to install the development dependencies)

or publish the gem to a gem hosting service, e.g. [RubyGems](https://rubygems.org/).

Finally add this to the Gemfile:

    gem 'vantage-client', '~> 0.0.5'

### Install from Git

If the Ruby gem is hosted at a git repository: https://github.com/YOUR_GIT_USERNAME/YOUR_GIT_REPO, then add the following in the Gemfile:

    gem 'vantage-client', :git => 'https://github.com/YOUR_GIT_USERNAME/YOUR_GIT_REPO.git'

### Include the Ruby code directly

Include the Ruby code directly using `-I` as follows:

```shell
ruby -Ilib script.rb
```

## Getting Started

Please follow the [installation](#installation) procedure and then run the following code:
```ruby
# Load the gem
require 'vantage-client'

# Setup authorization
Vantage.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Vantage::PingApi.new

begin
  api_instance.ping
rescue Vantage::ApiError => e
  puts "Exception when calling PingApi->ping: #{e}"
end

```

## Documentation for API Endpoints

All URIs are relative to *https://api.vantage.sh*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*Vantage::PingApi* | [**ping**](docs/PingApi.md#ping) | **GET** /v1/ping | 
*Vantage::PricesApi* | [**get_price**](docs/PricesApi.md#get_price) | **GET** /v1/products/{product_id}/prices/{id} | 
*Vantage::PricesApi* | [**get_prices**](docs/PricesApi.md#get_prices) | **GET** /v1/products/{product_id}/prices | 
*Vantage::PricesApi* | [**get_product**](docs/PricesApi.md#get_product) | **GET** /v1/products/{id} | 
*Vantage::PricesApi* | [**get_products**](docs/PricesApi.md#get_products) | **GET** /v1/products | 
*Vantage::PricesApi* | [**get_providers**](docs/PricesApi.md#get_providers) | **GET** /v1/providers | 
*Vantage::PricesApi* | [**get_services**](docs/PricesApi.md#get_services) | **GET** /v1/services | 


## Documentation for Models

 - [Vantage::Price](docs/Price.md)
 - [Vantage::Prices](docs/Prices.md)
 - [Vantage::Product](docs/Product.md)
 - [Vantage::Products](docs/Products.md)
 - [Vantage::Provider](docs/Provider.md)
 - [Vantage::Providers](docs/Providers.md)
 - [Vantage::Service](docs/Service.md)
 - [Vantage::Services](docs/Services.md)


## Documentation for Authorization


### oauth2

- **Type**: OAuth
- **Flow**: application
- **Authorization URL**: 
- **Scopes**: 
  - read: Grants read access
