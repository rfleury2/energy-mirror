class ImportUtilityAccounts
  include Interactor

  def call
    UtilityApi::Client.new.get_authorizations.each do |authorization_hash|
      UtilityAccount.find_or_create_by!(
        customer_email: authorization_hash[:customer_email],
        utility_name: authorization_hash[:utility_name],
        resource_type: authorization_hash[:resource_type],
        utility_data_provider_id: authorization_hash[:utility_data_provider_id],
        utility_data_provider_name: authorization_hash[:utility_data_provider_name]
      )
    end
  end
end