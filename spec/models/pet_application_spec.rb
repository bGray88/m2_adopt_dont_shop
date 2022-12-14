require 'rails_helper'

RSpec.describe PetApplication, type: :model do
  describe 'relationships' do
    it { should belong_to(:application) }
    it { should belong_to(:pet) }
  end

  describe 'has status attributes' do
    it 'can change the status' do
      shelter     = create(:shelter)
      application = Application.create!(name: "Anthony", street_address: "place", city: "Tino", state: "CO", zip_code: "24325", description: "hellp", status: "pending")
      pet         = application.pets.create!(adoptable: true, age: 99, breed: "terrier", name: "booboo", shelter: shelter)
      pet_app = PetApplication.find_by(pet_id: pet.id)
      expect(pet_app.status).to eq("pending")

      pet_app.accepted!

      expect(pet_app.status).to eq("accepted")

      pet_app.rejected!

      expect(pet_app.status).to eq("rejected")
    end
  end

  describe '#change_status' do
    it 'can change the status via instance method' do
      shelter     = create(:shelter)
      application = Application.create!(name: "Anthony", street_address: "place", city: "Tino", state: "CO", zip_code: "24325", description: "hellp", status: "pending")
      pet         = application.pets.create!(adoptable: true, age: 99, breed: "terrier", name: "booboo", shelter: shelter)
      pet_app = PetApplication.find_by(pet_id: pet.id)
      expect(pet_app.status).to eq("pending")

      pet_app.change_status("accepted")

      expect(pet_app.status).to eq("accepted")
      
      pet_app.change_status("rejected")

      expect(pet_app.status).to eq("rejected")
    end
  end

  describe '#add_record' do
    it 'creates a new record' do
      shelter     = create(:shelter)
      application = Application.create(name: "Anthony", street_address: "place", city: "Tino", state: "CO", zip_code: "24325", description: "hellp", status: "pending")
      pet         = Pet.create(adoptable: true, age: 99, breed: "terrier", name: "booboo", shelter: shelter)

      pet_app = PetApplication.find_by(pet_id: pet.id, application_id: application.id)

      expect(pet_app).to be(nil)

      PetApplication.add_record(application.id, pet.id)

      pet_app = PetApplication.find_by(pet_id: pet.id, application_id: application.id)

      expect(pet_app[:pet_id]).to be(pet.id)
    end
  end
end