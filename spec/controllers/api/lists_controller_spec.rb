require 'rails_helper'

RSpec.describe Api::ListsController, type: :controller do
	 let(:my_user) { User.create!(name: "todo User", password: "helloworld")}
	 let(:my_list) { List.create!(listname: "todo List", permissions: "private")}

	 let(:new_list) do
     {
         listname: "JigList",
         permissions: "private"
     }
   	 end

   	before :each do
 		allow(controller).to receive(:authenticated?)
 	end

 	describe "POST create" do
 		it "creates a new list" do
 			post :create, user_id: my_user.id, list: new_list
 			expect(List.count).to eq 1
 		end
 	end

 	describe "DELETE destroy" do
		it "Deletes new list" do    
        	delete :destroy, user_id: my_user.id, id: my_list.id
			expect(List.count).to eq 0
		end
	end

	describe "PUT update" do
		it "updates my_list" do
			newListname = "Jig List"
			newPermissions = "open"
			#my_list.permissions = newPermissions
			put :update, user_id: my_user.id, id: my_list.id, list: {permissions: newPermissions}
			expect(my_list.permissions).to eq newPermissions
		end
	end
end
