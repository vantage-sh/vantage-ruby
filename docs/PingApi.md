# Vantage::PingApi

All URIs are relative to *https://api.vantage.sh*

Method | HTTP request | Description
------------- | ------------- | -------------
[**ping**](PingApi.md#ping) | **GET** /v1/ping | 


# **ping**
> ping



This is a health check endpoint that can be used to determine Vantage API healthiness. It will return a 200 success with the raw text of \"pong\" if everything is running smoothly.

### Example
```ruby
# load the gem
require 'vantage-client'
# setup authorization
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

### Parameters
This endpoint does not need any parameter.

### Return type

nil (empty response body)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



