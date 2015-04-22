class CreateAccumulations < ActiveRecord::Migration
  def change
    create_table :accumulations do |t|
      t.references  :category
      t.references  :province
      t.string  :value
    end

    add_index :accumulations, :category_id
    add_index :accumulations, :province_id
  end
end
