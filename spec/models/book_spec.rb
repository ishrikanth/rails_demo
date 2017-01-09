require 'rails_helper'

RSpec.describe Book, type: :model do
  context "Postive scenario" do
  	it "saves 2 records" do
  		b1= Book.create(name: "Books1",publication: "publication1",user_id: 1)
  		b2= Book.create(name: "Books2",publication: "publication2",user_id: 1)
  		expect(Book.last(2)).to eq ([b1,b2])
  	end

  		it "saves records using Factory Girl" do
  		b1= FactoryGirl.create(:book)
  		b2= FactoryGirl.create(:book, name: "book2")
  		expect(Book.last(2)).to eq ([b1,b2])
  	end
  end
    context "-ve scenario" do
  	it "invalid record" do
  		b1= Book.create(name: nil, publication: "publication1",user_id: 1)
  		expect(Book.last).to_not be_valid
  	end
  	it "invalid record" do
  		b2= FactoryGirl.build(:invalid_book)
  		expect(Book.last).to_not be_valid
  	end
  end
end
