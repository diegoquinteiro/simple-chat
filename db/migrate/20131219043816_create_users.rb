class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.string :facebook_uid

      t.timestamps
    end
  end
end