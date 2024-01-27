class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :content,   null: false
      t.references :prototype,  foreign_key: false
      t.references :user,  foreign_key: false 
      t.timestamps
    end
  end
end
