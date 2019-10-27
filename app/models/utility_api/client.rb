# EXPERIMENTAL UNTESTED CODE

module UtilityApi
  class Client
    def initialize(api_key: ENV['UTILITY_API_TOKEN'])
      @api_key = api_key
    end

    BASE_URL = 'https://utilityapi.com/api/v2'

    def get_authorizations
      url = BASE_URL + '/authorizations' + request_params
      uri = URI(url)
      result = Net::HTTP.get(uri)
      authorizations_response = JSON.parse(result)
      authorizations_response['authorizations'].map do |authorization_hash|
        {
          customer_email: authorization_hash['customer_email'],
          utility_name: authorization_hash['utility'],
          resource_type: 'electricity',
          utility_data_provider_id: authorization_hash['uid'],
          utility_data_provider_name: 'utility_api',
          is_invalid: authorization_hash['status'] == "errored"
        }
      end
    end

    def get_meters(authorization_id)
      filtering_param = "&authorizations=#{authorization_id}"
      url = BASE_URL + '/meters' + request_params + filtering_param
      uri = URI(url)
      result = Net::HTTP.get(uri)
      meters_response = JSON.parse(result)
      meters_response['meters'].map do |meter_hash|
        base = meter_hash['base']

        {
          utility_data_provider_name: 'utility_api',
          utility_data_provider_id: meter_hash['uid'],
          meter_number: base['meter_numbers'].first,
          service_address: base['service_address'],
          status: meter_hash['status']
        }
      end
    end

    private

    def request_params
      "?access_token=#{@api_key}"
    end
  end
end