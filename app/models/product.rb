class Product < ActiveRecord::Base
	has_many :order_items
	has_many :order_headers, through: :order_items
	has_many :inventories
	has_many :stores, through: :inventories
	belongs_to :vendor
	has_many :po_items
	has_many :po_headers, through: :po_items
	belongs_to :product_category
end
