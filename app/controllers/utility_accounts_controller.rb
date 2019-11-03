class UtilityAccountsController < ApplicationController
  before_action :authenticate_user!

  def index
    @utility_accounts = UtilityAccount.all
  end

  def new
  end
end
