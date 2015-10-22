class POHeader < ActiveRecord::Base
	belongs_to :store, class_name: "Store",
	                   foreign_key: "store_number"
	belongs_to :vendor
	has_many :po_items
	has_many :products, through: :po_items
end
