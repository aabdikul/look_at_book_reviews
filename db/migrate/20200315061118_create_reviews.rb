class CreateReviews < ActiveRecord::Migration[6.0]
  def change
  	create_table :reviews do |t|
  		t.string :summary
  		t.integer :user_id
  		t.integer :book_id
  	end
  end
end
