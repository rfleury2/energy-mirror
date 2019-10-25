class UtilityAccountsController < ApplicationController
  def index
    @utility_accounts = UtilityAccount.all
  end
end
