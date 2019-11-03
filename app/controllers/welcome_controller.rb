class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @organization = current_user.organization
    @buildings = @organization.buildings
    @utility_accounts = @organization.utility_accounts
  end

  def profile
    @user = current_user
    @organization = current_user.organization
    @errors = params[:errors]
    @success = params[:success]
    @organization_errors = params[:organization_errors]
    @organization_success = params[:organization_success]
  end

  def update
    if current_user.update(user_update_params)
      redirect_to profile_path(success: true)
    else
      redirect_to profile_path(errors: current_user.errors.full_messages)
    end
  end

  private

  def user_update_params
    params.permit(:display_name, :email)
  end
end