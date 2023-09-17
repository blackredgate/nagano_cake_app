class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_method: {credit_card: 0, transfer: 1}

  validates :customer_id, presence: true
  validates :payment, presence: true
  validates :postage, presence: true
  validates :payment_method, presence: true
  validates :shipping_name, presence: true
  validates :shipping_postal_code, presence: true
  validates :shipping_address, presence: true
end
