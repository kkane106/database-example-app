class Employee < ActiveRecord::Base
  belongs_to :person
  belongs_to :pay_type
  belongs_to :employee, foreign_key: "supervisor_id"
  belongs_to :store, foreign_key: "store_number"
end
