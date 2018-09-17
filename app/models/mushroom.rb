class Mushroom < ApplicationRecord
  scope :find_lazy, -> (options) { where(options) }

end


