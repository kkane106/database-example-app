class Store < ActiveRecord::Base
  has_many :inventories
  has_many :products, through: :inventories
  has_many :order_headers
  has_many :order_items, through: :order_headers
  has_many :po_headers
  has_many :po_items, through: :po_headers
  has_many :employees
end
