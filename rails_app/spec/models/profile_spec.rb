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

require 'spec_helper'

class ProfileSpec < ActiveSupport::TestCase

end
