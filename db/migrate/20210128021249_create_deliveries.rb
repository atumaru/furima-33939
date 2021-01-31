class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :postal_code,    default: "",     null: false
      t.integer :prefecture_id,                  null: false
      t.string :city,           default: "",     null: false
      t.string :address,   default: "",          null: false
      t.string :building,  default: ""          
      t.string :phone_number,                    null: false
      t.references :order,                     foreign_key: true

      t.timestamps
    end
  end
end
