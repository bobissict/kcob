# == Schema Information
#
# Table name: profiles
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  first_name        :string
#  last_name         :string
#  year_matriculated :integer
#  city              :integer
#  country           :integer
#  industry_id       :integer
#  company           :string
#  position          :string
#  facebook_url      :string
#  linkedin_url      :string
#  email             :string
#  activated         :boolean          default(FALSE)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  house             :string
#

FactoryGirl.define do
  factory :profile do
    user
    industry
    first_name    "John"
    sequence(:last_name) { |n| "Doe#{n}" }
    year_matriculated 2005
    house "Gillingham"
    city "Cape Town"
    country "South Africa"
    position "Tester"
    facebook_url "https://facebook.com/test"
    linkedin_url "https://linkedin.com/test"
    activated true
  end
end
