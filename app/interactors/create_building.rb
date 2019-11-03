class CreateBuilding
  include Interactor

  def call
    new_attributes = context.new_attributes
    context.building = Building.new(new_attributes)
    context.building.organization = Organization.first
    context.fail! unless context.building.save
  end
end