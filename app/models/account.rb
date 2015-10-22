class Account < ActiveRecord::Base
  belongs_to :customer, class_name: "Person",
                        foreign_key: "customer_id"
  has_many :order_headers
  has_many :order_items, through: :order_headers
  belongs_to :account_type
end
