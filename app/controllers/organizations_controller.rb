class OrganizationsController < ApplicationController
  def update
    organization = Organization.find(params[:id])
    if organization.update(organization_params)
      redirect_to profile_path(organization_success: true)
    else
      redirect_to profile_path(organization_errors: organization.errors.full_messages)
    end
  end

  private

  def organization_params
    params.permit(:display_name)
  end
end
