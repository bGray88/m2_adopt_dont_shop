application   = FactoryBot.create(:application)
application_2 = Application.create!(name: "Anthony", street_address: "place", city: "Tino", state: "CO", zip_code: "24325", description: "hellp", status: "pending")
shelter_1     = FactoryBot.create(:shelter) 
shelter_2     = FactoryBot.create(:shelter) 
shelter_3     = FactoryBot.create(:shelter) 
vet_office    = FactoryBot.create(:veterinary_office)
vet_1         = FactoryBot.create(:veterinarian, veterinary_office: vet_office)
vet_2         = FactoryBot.create(:veterinarian, veterinary_office: vet_office)
pet_1         = FactoryBot.create(:pet, shelter: shelter_1)
pet_2         = FactoryBot.create(:pet, shelter: shelter_1)
pet_3         = FactoryBot.create(:pet, shelter: shelter_1)
pet_4         = application_2.pets.create!(adoptable: true, age: 99, breed: "terrier", name: "booboo", shelter: shelter_1)
