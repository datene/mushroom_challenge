class MushroomsController < ApplicationController
  def index
    load_category_options
    collect_mushrooms
    set_mushroom_attributes
  end

  private

  def collect_mushrooms
    if params[:query]
      @active_param_queries = map_param_options
      @mushrooms = Mushroom.find_lazy(@active_param_queries).paginate(page: params[:page], per_page: 100)
    else
      @active_param_queries = {}
      @mushrooms = Mushroom.order(id: :asc).paginate(page: params[:page], per_page: 100)
    end
  end

  def set_mushroom_attributes
    @mushroom_attributes = mushroom_attributes
  end

  def load_category_options
    @mushroom_category_options = YAML.load_file('db/data/mushroom_category_options.yml')
  end

  def mushroom_attributes
    Mushroom.new.attributes.keys - %w(created_at updated_at)
  end

  def map_param_options
    permitted = params.permit(@mushroom_category_options.keys.map { |item| item.to_sym})
    permitted_symbolized_keys = permitted.to_h.symbolize_keys
    filtered_params = permitted_symbolized_keys.reject! { |key| permitted_symbolized_keys[key] == " " }
  end

end