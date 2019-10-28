class BuildingsController < ApplicationController
  def index
    # TODO: Build index page
    redirect_to building_path(Building.first)
  end

  def show
    @building = Building.find_by(id: params[:id])
    @utility_meters = @building.utility_meters.eager_load(:utility_account)
    @utility_bills = UtilityBill.where(utility_meter: @utility_meters).limit(8).preload(:utility_meter).reverse
  end

  def chart_data
    @utility_meters = Building.find(params[:building_id]).utility_meters
    @utility_bills = UtilityBill.where(utility_meter: @utility_meters).limit(12).preload(:utility_meter).reverse
    chart_data = [
      {
        type: "stackedArea",
        name: "Electricity Cost",
        showInLegend: true,
        xValueFormatString: "YYYY",
        dataPoints: @utility_bills.map do |ub|
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
        dataPoints: @utility_bills.map do |ub|
          {
            x: "#{ub.end_date.year}/#{ub.end_date.month}",
            y: ub.total_cost * (Random.rand / 3)
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
end
