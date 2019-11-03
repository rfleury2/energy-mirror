# EXPERIMENTAL UNTESTED CODE

module UtilityApi
  class Client
    def initialize(api_key: ENV['UTILITY_API_TOKEN'])
      @api_key = api_key
    end

    BASE_URL = 'https://utilityapi.com/api/v2'

    def get_authorizations
      url = BASE_URL + '/authorizations' + auth_param
      response = execute_api_request(url)

      return [] unless response['authorizations']
      response['authorizations'].map do |authorization_hash|
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

    def get_meters(authorization_uid)
      filtering_param = "&authorizations=#{authorization_uid}"
      url = BASE_URL + '/bills' + auth_param + filtering_param
      response = execute_api_request(url)

      return [] unless response['meters']
      response['meters'].map do |meter_hash|
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

    def get_bills(meter_uid)
      filtering_param = "&meters=#{meter_uid}"
      url = BASE_URL + '/bills' + auth_param + filtering_param
      response = execute_api_request(url)

      return [] unless response['bills']
      response['bills'].map do |bill_hash|
        base_hash = bill_hash['base']

        {
          utility_data_provider_name: 'utility_api',
          utility_data_provider_id: bill_hash['uid'],
          end_date: Date.parse(base_hash['bill_end_date']),
          start_date: Date.parse(base_hash['bill_start_date']),
          statement_date: Date.parse(base_hash['bill_statement_date']),
          total_cost: base_hash['bill_total_cost'],
          total_unit: base_hash['bill_total_unit'],
          total_volume: base_hash['bill_total_volume']
        }
      end
    end

    private

    def execute_api_request(url)
      uri = URI(url)
      result = Net::HTTP.get(uri)
      JSON.parse(result)
    end

    def auth_param
      "?access_token=#{@api_key}"
    end
  end
end