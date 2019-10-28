class BuildingsController < ApplicationController
  def index
    # TODO: Build index page
    redirect_to building_path(Building.first)
  end

  def show
    @building = Building.find_by(id: params[:id])
    @utility_meters = @building.utility_meters.eager_load(:utility_account)
    @utility_bills = UtilityBill.where(utility_meter: @utility_meters).limit(8).preload(:utility_meter)
  end
end
