class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :industry

  scope :by_house, -> (house) { where(house: house) }
  scope :by_year_matriculated, -> (year) { where(year_matriculated: year) }
end
