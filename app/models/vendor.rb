class Vendor < ActiveRecord::Base
  has_many :products
  has_many :po_headers
  has_many :po_items, through: :po_headers
  belongs_to :vendor_rep, class_name: "Person", 
                          foreign_key: "vendor_rep_id"
end
