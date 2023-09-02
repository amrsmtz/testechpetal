require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  it "is valid with valid attributes" do
    pokemon = Pokemon.new(
      name: "Pikachu",
      type_1: "Electric",
      total: 320,
      hp: 35,
      attack: 55,
      defense: 40,
      sp_atk: 50,
      sp_def: 50,
      speed: 90,
      generation: 1,
      legendary: false
    )
    expect(pokemon).to be_valid
  end

  it "is not valid without a name" do
    pokemon = Pokemon.new(name: nil)
    expect(pokemon).to_not be_valid
  end
end
