class Delivery < ActiveRecord::Base
  belongs_to :import
  belongs_to :product
end
