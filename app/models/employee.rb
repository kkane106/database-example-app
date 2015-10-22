class Employee < ActiveRecord::Base
  belongs_to :person
  has_one :pay_type
  belongs_to :store, foreign_key: "store_number"
end
