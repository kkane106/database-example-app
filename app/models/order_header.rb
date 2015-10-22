class OrderHeader < ActiveRecord::Base
	belongs_to :person
	has_many   :order_items
	has_many   :products, through: :order_items
	belongs_to :account
	belongs_to :customer, class_name: "Person",
	                      foreign_key: "customer_id"
end
