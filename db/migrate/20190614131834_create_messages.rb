class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
    	t.string :name
    	t.text :text
    	t.string :phone
    	t.string :email
    	
      t.timestamps
    end
  end
end
