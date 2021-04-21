# Vantage::PricesApi

All URIs are relative to *https://api.vantage.sh*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_price**](PricesApi.md#get_price) | **GET** /v1/products/{product_id}/prices/{id} | 
[**get_prices**](PricesApi.md#get_prices) | **GET** /v1/products/{product_id}/prices | 
[**get_product**](PricesApi.md#get_product) | **GET** /v1/products/{id} | 
[**get_products**](PricesApi.md#get_products) | **GET** /v1/products | 
[**get_providers**](PricesApi.md#get_providers) | **GET** /v1/providers | 
[**get_services**](PricesApi.md#get_services) | **GET** /v1/services | 


# **get_price**
> Price get_price(product_id, id)



Returns a price

### Example
```ruby
# load the gem
require 'vantage-client'
# setup authorization
Vantage.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Vantage::PricesApi.new

product_id = 'product_id_example' # String | 

id = 'id_example' # String | Unique identifier of the price e.g. aws-ec2-m5d_16xlarge-eu_central_1-on_demand-linux_enterprise


begin
  result = api_instance.get_price(product_id, id)
  p result
rescue Vantage::ApiError => e
  puts "Exception when calling PricesApi->get_price: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **product_id** | **String**|  | 
 **id** | **String**| Unique identifier of the price e.g. aws-ec2-m5d_16xlarge-eu_central_1-on_demand-linux_enterprise | 

### Return type

[**Price**](Price.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_prices**
> Prices get_prices(product_id)



Return available Prices across all Regions for a Product.

### Example
```ruby
# load the gem
require 'vantage-client'
# setup authorization
Vantage.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Vantage::PricesApi.new

product_id = 'product_id_example' # String | The Product ID that you wish to query prices for.


begin
  result = api_instance.get_prices(product_id)
  p result
rescue Vantage::ApiError => e
  puts "Exception when calling PricesApi->get_prices: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **product_id** | **String**| The Product ID that you wish to query prices for. | 

### Return type

[**Prices**](Prices.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_product**
> Product get_product(id)



Return a product

### Example
```ruby
# load the gem
require 'vantage-client'
# setup authorization
Vantage.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Vantage::PricesApi.new

id = 'id_example' # String | Unique identifier of the product e.g. aws-ec2-m5d_16xlarge


begin
  result = api_instance.get_product(id)
  p result
rescue Vantage::ApiError => e
  puts "Exception when calling PricesApi->get_product: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Unique identifier of the product e.g. aws-ec2-m5d_16xlarge | 

### Return type

[**Product**](Product.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_products**
> Products get_products(opts)



Return available Products for a Service. For example, with a Provider of AWS and a Service of EC2, Products will be a list of all EC2 Instances. By default, this endpoint returns all Products across all Services and Providers but has optional query parameters for filtering listed below.

### Example
```ruby
# load the gem
require 'vantage-client'
# setup authorization
Vantage.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Vantage::PricesApi.new

opts = { 
  provider_id: 'provider_id_example', # String | Query by Provider to list all Products across all Services for a Provider. e.g. aws
  service_id: 'service_id_example', # String | Query by Service to list all Products for a specific provider service. e.g. aws-ec2
  name: 'name_example' # String | Query by name of the Product to see a list of products which match that name. e.g. m5a.16xlarge
}

begin
  result = api_instance.get_products(opts)
  p result
rescue Vantage::ApiError => e
  puts "Exception when calling PricesApi->get_products: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **provider_id** | **String**| Query by Provider to list all Products across all Services for a Provider. e.g. aws | [optional] 
 **service_id** | **String**| Query by Service to list all Products for a specific provider service. e.g. aws-ec2 | [optional] 
 **name** | **String**| Query by name of the Product to see a list of products which match that name. e.g. m5a.16xlarge | [optional] 

### Return type

[**Products**](Products.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_providers**
> Providers get_providers



Providers are cloud infrastructure and service providers from which all cloud prices are derived. You can think of example Providers as being AWS, GCP, Cloudflare or Datadog. Currently, Vantage only supports a single provider of AWS but over time more will be added. Use this endpoint to retrieve a provider id for other API calls.

### Example
```ruby
# load the gem
require 'vantage-client'
# setup authorization
Vantage.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Vantage::PricesApi.new

begin
  result = api_instance.get_providers
  p result
rescue Vantage::ApiError => e
  puts "Exception when calling PricesApi->get_providers: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Providers**](Providers.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_services**
> Services get_services(opts)



Return all Services. Examples of Services are EC2 for AWS. This endpoint will return all Services by default but you have the ability to filter Services by Provider using the optional query parameter documented below.

### Example
```ruby
# load the gem
require 'vantage-client'
# setup authorization
Vantage.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Vantage::PricesApi.new

opts = { 
  provider_id: 'provider_id_example' # String | Query services for a specific provider. e.g. aws
}

begin
  result = api_instance.get_services(opts)
  p result
rescue Vantage::ApiError => e
  puts "Exception when calling PricesApi->get_services: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **provider_id** | **String**| Query services for a specific provider. e.g. aws | [optional] 

### Return type

[**Services**](Services.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



