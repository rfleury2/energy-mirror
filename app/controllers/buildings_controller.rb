class BuildingsController < ApplicationController
  def index
    # TODO: Build index page
    redirect_to building_path(Building.first)
  end

  def show
    @building = Building.find_by(id: params[:id])
  end
end
