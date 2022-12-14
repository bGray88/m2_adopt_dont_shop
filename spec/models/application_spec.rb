require 'rails_helper'

RSpec.describe Application, type: :model do
  describe 'relationships' do
    it { should have_many(:pet_applications) }
    it { should have_many(:pets).through(:pet_applications) }
  end

  describe 'application methods and attributes' do
    before :each do
      @application = create(:application)
      @shelter_1   = create(:shelter)
      @pet_1       = create(:pet, shelter: @shelter_1)
      @pet_2       = create(:pet, shelter: @shelter_1)
      @pet_3       = create(:pet, shelter: @shelter_1)
    end
  end
end