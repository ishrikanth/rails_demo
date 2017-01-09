require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
	describe "GET #index" do
		it "response 200 status code" do
			get :index
			 expect(response.response_code).to eq 200
			  expect(response).to render_template("index")
			  b1= FactoryGirl.create(:product)
			  expect(assigns(:products)).to include(b1)
			end
		end

	describe "POST #create" do
		it "response 200 status code" do
			expect{
	        post :create, product: FactoryGirl.attributes_for(:invalid_product)
	      }.to_not change(Product,:count)
	    
			end

		it "redirects to the new product" do
	      post :create, product: FactoryGirl.attributes_for(:product)
	      expect(response).to redirect_to Product.last
	    end

	    it "re-renders the new method" do
	      post :create, product: FactoryGirl.attributes_for(:invalid_product)
	      expect(response).to render_template :new
	    end
	  
		end

		describe "delete #Destroy" do
			it "delete" do
			  product= FactoryGirl.create(:product)
			   expect{
	      delete :destroy, id: product        
	    }.to change(Product,:count).by(-1)
	     end

	     it "redirects to products#index" do
	     	 product= FactoryGirl.create(:product)
	    delete :destroy, id: product
	    expect(response).to redirect_to products_url
	  end


		end
end
