require 'rails_helper'

RSpec.describe Api::ItemsController, type: :controller do

	let(:my_list) { List.create!(listname: "todo List", permissions: "private")}
	let(:my_item) { Item.create!(info: "this is the info", complete: "false")}

	 let(:new_item) do
     {
         info: "Jigs item is this first item",
         complete: "false"
     }
   	 end

   	before :each do
 		allow(controller).to receive(:authenticated?)
 	end

 	describe "POST create" do
 		it "creates a new item" do
 			post :create, list_id: my_list.id, item: new_item
 			expect(Item.count).to eq 1
 		end
 	end

 	describe "DELETE destroy" do
		it "Deletes new list" do    
        	delete :destroy, list_id: my_list.id, id: my_item.id
			expect(Item.count).to eq 0
		end
	end

	describe "PUT update" do
		it "updates my_item" do
			newIteminfo = "Jig List"
			newCompletion = "true"
			put :update, list_id: my_list.id, id: my_item.id, item: {complete: newCompletion}
			expect(my_item.complete).to eq newCompletion
		end
	end

end
