require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("Tamir") }
  subject(:dessert) { Dessert.new("Cookie", 30, chef )}

  describe "#initialize" do
    it "sets a type" do 
      expect(dessert.type).to eq("Cookie")
    end

    it "sets a quantity" do 
      expect(dessert.quantity).to eq(30)
    end

    it "starts ingredients as an empty array" do 
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do 
      expect{ Dessert.new("Brownie", "thirty", "Tamir")}.to  raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("sugar")
      expect(dessert.ingredients[0]).to eq("sugar")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["sugar", "flour", "water"]
      ingredients.each{|el| dessert.add_ingredient(el)}
      dessert.mix!
      expect(dessert.ingredients).to_not eq(ingredients)

    end

  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do 
      dessert.eat(10)
      expect(dessert.quantity).to eq(20)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{ dessert.eat(40)}.to raise_error("not enough left!")
    end

  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do 
    allow(chef).to receive(:titleize).and_return("Tamir")

      expect(dessert.serve).to include("Tamir")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do 

    end
  end
end
