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
    15.times do |n|
      store_number = Faker::Number.between(1,4)
      person_id = counter
      counter = counter + 1
      pay_type_code = Faker::Number.between(1,3)
      pay_amount = PayType.find(pay_type_code).minimum_wage
      title = PayType.find(pay_type_code).pay_type_name
      supervisor_id = Faker::Number.between(1,4)
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
