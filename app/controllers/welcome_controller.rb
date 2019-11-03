class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @organization = current_user.organization
    @buildings = @organization.buildings
    @utility_accounts = @organization.utility_accounts
  end
end