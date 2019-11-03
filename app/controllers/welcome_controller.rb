class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @organization = current_user.organization
    @buildings = Building.all
    @utility_accounts = UtilityAccount.all
  end
end