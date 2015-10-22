class OrderHeader < ActiveRecord::Base
	belongs_to :person
	has_many   :order_items
	has_many   :products, through: :order_items
end
