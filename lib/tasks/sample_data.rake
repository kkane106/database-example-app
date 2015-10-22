require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    20.times do |n|
      lastname = Faker::Name.last_name
      firstname = Faker::Name.first_name
      mi = Faker::Lorem.characters(1).capitalize
      street = Faker::Address.street_address
      city = Faker::Address.city
      state = Faker::Address.state_abbr
      zip = Faker::Address.zip
      area_code = Faker::Number.number(3)
      phone_number = Faker::Number.number(7)
      Person.create!(:lastname => lastname,
                   :firstname => firstname,
                   :mi => mi,
                   :street => street,
                   :city => city,
                   :state => state,
                   :zip => zip,
                   :area_code => area_code,
                   :phone_number => phone_number)
    end

    names = ["Grunt", "Troll", "Super"]
    wage = [18000, 22000, 50000]
    3.times do |n|
      pay_type_name = names.pop
      minimum_wage = wage.pop
      PayType.create!(:pay_type_name => pay_type_name,
                      :minimum_wage => minimum_wage)
    end
    
    counter = 1
    store = 1
    supers = [4,4,4,3,3,3,3,2,2,2,2,1,1,1,0]
    15.times do |n|
      supervisor_id = supers.pop
      store_number = 0
      if supers[supers.length-1] == 0
        store_number = 0
      elsif supers[supers.length-1] == 1
         store_number = store
         store = store + 1
      else
         store_number = Employee.find(supervisor_id).store_number
      end
      person_id = counter
      counter = counter + 1
      pay_type_name = ""
      case supervisor_id
        when 0
          pay_type_name = "Super"
        when 1
          pay_type_name = "Troll"
        when 2..4
          pay_type_name = "Grunt"
        else
          pay_type_name = "unkown"
      end
      pay_type = PayType.where(pay_type_name: pay_type_name).first
      pay_amount = pay_type.minimum_wage
      pay_type_code = pay_type.id
      title = pay_type_name
      Employee.create!(:store_number => store_number,
                       :person_id => person_id,
                       :pay_type_code => pay_type_code,
                       :pay_amount => pay_amount,
                       :title => title,
                       :supervisor_id => supervisor_id)
    end

    50.times do |n|
      invoice_number = Faker::Number.number(6)
      store_number = 1+rand(10)
      person_id = 1+rand(20)
      account_number = 1+rand(20)
      amount_due = Faker::Commerce.price
      OrderHeader.create!(:invoice_number => invoice_number,
                          :store_number => store_number,
                          :person_id => person_id,
                          :account_number => account_number,
                          :amount_due => amount_due)
    end

    200.times do |n|
    invoice_number = OrderHeader.find(1+rand(50)).invoice_number
    product_id = 1+rand(50)
    quantity = Faker::Number.number(1)
    discount = Faker::Number.between(25,50)
    OrderItem.create!(:invoice_number => invoice_number,
                      :product_id => product_id,
                      :quantity => quantity,
                      :discount => discount)
    end

    50.times do |n|
    description = Faker::Lorem.sentence
    price = Faker::Commerce.price
    reorder_threshold = Faker::Number.number(2)
    Product.create!(:description => description,
                    :price => price,
                    :reorder_threshold => reorder_threshold)
    end
  end
end
