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

    def get_bills

    end

    private

    def request_params
      "?access_token=#{@api_key}"
    end
  end
end