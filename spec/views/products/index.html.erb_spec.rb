require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      p1=Product.create!(
        :name => "Name",
        :price => 2
      ),
      p2=Product.create!(
        :name => "Name",
        :price => 2
      )
    ])
  end

  it "renders a list of products" do
       render :template => "products/index", :layout => "layouts/application" 
       expect(rendered).to include("Name")
  end
end
