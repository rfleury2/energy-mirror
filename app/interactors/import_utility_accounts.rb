class ImportUtilityAccounts
  include Interactor

  def call
    UtilityApi::Client.new.get_authorizations.each do |authorization_hash|
      next if authorization_hash[:is_invalid]

      utility_account = UtilityAccount.find_or_initialize_by(
        utility_data_provider_id: authorization_hash[:utility_data_provider_id],
        utility_data_provider_name: authorization_hash[:utility_data_provider_name]
      )

      utility_account.update(
        organization: Organization.first,
        customer_email: authorization_hash[:customer_email],
        utility_name: authorization_hash[:utility_name],
        resource_type: authorization_hash[:resource_type]
      )
    end
  end
end