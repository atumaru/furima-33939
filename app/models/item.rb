class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :info
    validates :price,inclusion: {in:(300..99999999)},format:{with:/\A[0-9]+\z/}
    validates :image
  end

  with_options presence: true,numericality: { other_than: 1} do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  
end
