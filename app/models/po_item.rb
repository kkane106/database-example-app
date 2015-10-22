class POItem < ActiveRecord::Base
	belongs_to :po_header
	belongs_to :product
end
