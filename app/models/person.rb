class Person < ActiveRecord::Base
	has_many :order_headers
	has_many :order_items, through: :order_headers
        has_one :employee
end
