=begin
#Vantage

#Vantage API

OpenAPI spec version: 1.0.0
Contact: support@vantage.sh
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.19

=end

require 'uri'

module Vantage
  class PingApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # This is a health check endpoint that can be used to determine Vantage API healthiness. It will return a 200 success with the raw text of \"pong\" if everything is running smoothly.
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def ping(opts = {})
      ping_with_http_info(opts)
      nil
    end

    # This is a health check endpoint that can be used to determine Vantage API healthiness. It will return a 200 success with the raw text of \&quot;pong\&quot; if everything is running smoothly.
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def ping_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PingApi.ping ...'
      end
      # resource path
      local_var_path = '/v1/ping'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['oauth2']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PingApi#ping\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
