# Vantage::CostsApi

All URIs are relative to *https://api.vantage.sh*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_costs**](CostsApi.md#get_costs) | **GET** /v1/reports/{report_id}/costs | 
[**get_report**](CostsApi.md#get_report) | **GET** /v1/reports/{report_id} | 
[**get_reports**](CostsApi.md#get_reports) | **GET** /v1/reports | 


# **get_costs**
> Costs get_costs(report_id, opts)



Return available Costs for the specified Cost Report and optional time period. If no time period is specified it will return all available costs for the report.

### Example
```ruby
# load the gem
require 'vantage-client'
# setup authorization
Vantage.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Vantage::CostsApi.new

report_id = 'report_id_example' # String | 

opts = { 
  start_date: 'start_date_example', # String | Query costs by the first date you would like to filter from. ISO 8601 Formatted - 2021-07-15 or 2021-07-15T19:20:48+00:00.
  end_date: 'end_date_example', # String | Query costs by the last date you would like to filter to. ISO 8601 Formatted - 2021-07-15 or 2021-07-15T19:20:48+00:00.
  page: 2, # Integer | The page of results to return.
  limit: 500 # Integer | The amount of results to return. The maximum is 1000
}

begin
  result = api_instance.get_costs(report_id, opts)
  p result
rescue Vantage::ApiError => e
  puts "Exception when calling CostsApi->get_costs: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **report_id** | **String**|  | 
 **start_date** | **String**| Query costs by the first date you would like to filter from. ISO 8601 Formatted - 2021-07-15 or 2021-07-15T19:20:48+00:00. | [optional] 
 **end_date** | **String**| Query costs by the last date you would like to filter to. ISO 8601 Formatted - 2021-07-15 or 2021-07-15T19:20:48+00:00. | [optional] 
 **page** | **Integer**| The page of results to return. | [optional] 
 **limit** | **Integer**| The amount of results to return. The maximum is 1000 | [optional] 

### Return type

[**Costs**](Costs.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_report**
> Report get_report(report_id)



Return a Cost Report.

### Example
```ruby
# load the gem
require 'vantage-client'
# setup authorization
Vantage.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Vantage::CostsApi.new

report_id = 'report_id_example' # String | 


begin
  result = api_instance.get_report(report_id)
  p result
rescue Vantage::ApiError => e
  puts "Exception when calling CostsApi->get_report: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **report_id** | **String**|  | 

### Return type

[**Report**](Report.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_reports**
> Reports get_reports(opts)



Return all Cost Reports.

### Example
```ruby
# load the gem
require 'vantage-client'
# setup authorization
Vantage.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Vantage::CostsApi.new

opts = { 
  page: 2, # Integer | The page of results to return.
  limit: 500 # Integer | The amount of results to return. The maximum is 1000
}

begin
  result = api_instance.get_reports(opts)
  p result
rescue Vantage::ApiError => e
  puts "Exception when calling CostsApi->get_reports: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **Integer**| The page of results to return. | [optional] 
 **limit** | **Integer**| The amount of results to return. The maximum is 1000 | [optional] 

### Return type

[**Reports**](Reports.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



