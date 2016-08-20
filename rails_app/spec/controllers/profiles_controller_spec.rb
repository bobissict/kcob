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

require 'rails_helper'

RSpec.describe ProfilesController, :type => :controller do
  describe "GET #index when not logged in" do
    it "should be redirected" do
      get :index
      expect(response).to_not be_success
      expect(response).to have_http_status(302)
    end
  end

  describe "GET #index when logged in" do
    before do
      @profile = FactoryGirl.create(:profile)
      sign_in @profile.user
      get :index
    end

    it "should be be succesful if logged in" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "assigns all the profiles" do
      get :index
      expect(assigns(:profiles).first).to eq @profile
    end

    after do
      sign_out @profile.user
    end
  end

  describe "GET #show" do
    before do
      @profile = FactoryGirl.create(:profile)
      sign_in @profile.user
    end

    it "returns valid profile" do
      get :show, id: @profile.id
      expect(assigns(:profile)).to eq @profile
      expect(response).to be_success
    end

    it "doesnt return invalid profile" do
      get :show, id: 'invalid_id'
      expect(assigns(:profile)).to eq nil
      expect(response).to_not be_success
    end

    after do
      sign_out @profile.user
    end
  end

  describe "POST #update" do
    before(:each) do
      @profile = FactoryGirl.create(:profile)
      sign_in @profile.user
    end

    let(:attr) do
      { :position => 'Manager' }
    end

    it "successfully updates a profile" do
      put :update, id: @profile.id, profile: attr
      @profile.reload
      expect(@profile.position).to eq attr[:position]
      expect(response).to be_success
    end
  end
end
