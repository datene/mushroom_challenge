class MushroomsController < ApplicationController
  def index
    @mushrooms = Mushroom.order(id: :asc).paginate(page: params[:page], per_page: 100)
    @mushroom_attributes = mushroom_attributes
  end

  private

  def mushroom_attributes
    Mushroom.new.attributes.keys - %w(created_at updated_at)
  end

end