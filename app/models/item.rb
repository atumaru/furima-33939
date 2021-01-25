class Item < ApplicationRecord
  has_one_attached :image

  validates :item_name,presence: true
  validates :item_info,presence: true
  validates :item_category,presence: true
  validates :item_sales_status,presence: true
  validates :item_shipping_fee_status,presence: true
  validates :item_prefecture,presence: true
  validates :item_scheduled_delivery,presence: true
  validates :item_price,presence: true
  validates :item_price,numericality:{reater_than_or_equal_to:300,less_than_or_qruel_to:9999999}
  validates :item_price,format:{/\A[0-9]+\z/}
end
