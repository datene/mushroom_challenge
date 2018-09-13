class MushroomsController < ApplicationController
  def index
    @mushrooms = Mushroom.all
    @mushroom_attributes = mushroom_attributes
  end

  private

  def mushroom_attributes
    Mushroom.new.attributes.keys
  end

end