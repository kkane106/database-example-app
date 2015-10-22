class Vendor < ActiveRecord::Base
  has_many :products
  has_many :po_headers
  has_many :po_items, through: :po_headers
  has_one :person, foreign_key: "vendor_rep_id"
end
