require 'rails_helper'

RSpec.describe 'As a visitor' do
  it "I see professor information on the professors index and is sorted alphabetically" do
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    hagarid = Professor.create(name: "Rubus Hagarid", age: 38 , specialty: "Care of Magical Creatures")
    lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    visit '/professors'

    within("#section_0") do
      expect(page).to have_content(lupin.name)
      expect(page).to have_content(lupin.age)
      expect(page).to have_content(lupin.specialty)
    end

    within("#section_1") do
      expect(page).to have_content(hagarid.name)
      expect(page).to have_content(hagarid.age)
      expect(page).to have_content(hagarid.specialty)
    end

    within("#section_2") do
      expect(page).to have_content(snape.name)
      expect(page).to have_content(snape.age)
      expect(page).to have_content(snape.specialty)
    end
  end
end
