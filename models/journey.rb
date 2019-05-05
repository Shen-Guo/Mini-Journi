class Journey < ActiveRecord::Base
  belongs_to :user
  has_many :places
  has_many :meals
end