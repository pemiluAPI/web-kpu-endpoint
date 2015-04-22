class CreateWebAddresses < ActiveRecord::Migration
  def change
    create_table :web_addresses do |t|
      t.references  :province
      t.string    :name
      t.string    :link
      t.string    :other_link
      t.string    :explanation
    end

    add_index :web_addresses, :province_id
  end
end
