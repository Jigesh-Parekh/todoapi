require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do

	 let(:my_user) { User.create!(name: "Bloccit User", password: "helloworld")}
	

	 let(:new_user) do
     {
         name: "Jig",
         password: "Jig"
     }
   	 end


 	before :each do
 		allow(controller).to receive(:authenticated?)
 	end

	describe 'Users#index returns all users' do

	     it "returns http success" do
	       
	       get :index
           expect(response).to have_http_status(:success)
         end

         it "returns http JSON" do
	        get :index
         	expect(response.content_type).to eq Mime::JSON
         end


	end

	describe "POST create" do
	     it "creates a new user" do
	         post :create, user: new_user
         	 expect(User.count).to eq 1
	     end

		 it "returns my_user serialized" do
		    post :create, user: new_user
		    created_user = JSON.parse(response.body).with_indifferent_access
	        expect(created_user[:name]).to eq(new_user[:name])
	        expect(created_user[:password]).to eq(new_user[:password])
	     end
	         
	end

	describe "DELETE destroy" do
		it "Deletes new user" do    
        	delete :destroy, id: my_user.id
			expect(User.count).to eq 0
		end

	end
end


