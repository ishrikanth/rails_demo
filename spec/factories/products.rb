FactoryGirl.define do
  factory :product do
    name "MyString"
    price 1
  end

   factory :invalid_product,parent: :product do
    name nil
    price 1
  end
end
