class BuildingsController < ApplicationController
  def new
    @building = Building.new
    @manual = params[:manual]
    @errors = params[:errors]
  end

  def create
    create_building_ctx = CreateBuilding.call(
      new_attributes: building_params.to_h
    )
    new_building = create_building_ctx.building

    if create_building_ctx.failure?
      redirect_to new_building_path(errors: new_building.errors.full_messages, manual: true)
    else
      redirect_to building_path(new_building)
    end
  end

  def index
    @buildings = Building.all
  end

  def show
    @building = Building.find_by(id: params[:id])
    @utility_meters = @building.utility_meters.eager_load(:utility_account)
    @utility_bills = UtilityBill.where(utility_meter: @utility_meters).limit(8).preload(:utility_meter).reverse
  end

  def chart_data
    @utility_meters = Building.find(params[:building_id]).utility_meters
    @utility_bills = UtilityBill.where(utility_meter: @utility_meters).preload(:utility_meter)
    chart_data = [
      {
        type: "stackedArea",
        name: "Electricity Cost",
        showInLegend: true,
        xValueFormatString: "YYYY",
        dataPoints: @utility_bills.electric.reverse.map do |ub|
          {
            x: "#{ub.end_date.year}/#{ub.end_date.month}",
            y: ub.total_cost
          }
        end
      },
      {
        type: "stackedArea",
        name: "Natural Gas Cost",
        showInLegend: true,
        xValueFormatString: "YYYY",
        dataPoints: @utility_bills.natural_gas.reverse.map do |ub|
          {
            x: "#{ub.end_date.year}/#{ub.end_date.month}",
            y: ub.total_cost
          }
        end
      }
    ]


    respond_to do |format|
      format.json do
        render json: chart_data
      end
    end
  end

  private

  def building_params
    params.permit(:display_name, :primary_property_type, :gross_square_feet, :address_line_1, :address_line_2, :city, :state, :zip_code)
  end
end
