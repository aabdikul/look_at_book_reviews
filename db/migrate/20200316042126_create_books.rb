class CreateBooks < ActiveRecord::Migration[6.0]
  def change
  	create_table :books do |t|
  		t.string :author
  		t.string :title
  	end
  end
end
