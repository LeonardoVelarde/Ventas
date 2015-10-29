class Client < ActiveRecord::Base
  validates :name, presence: {:message => 'You must enter a name something'}
  validates :nit, presence: {:message => 'You must enter clients nit'}
  validates :nit, numericality: {message: 'Only  numbers' }
end
