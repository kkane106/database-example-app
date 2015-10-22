class Product < ActiveRecord::Base
	has_many :order_items
	has_many :order_headers, through: :order_items
	has_many :inventories
	has_many :stores, through: :inventories
end
