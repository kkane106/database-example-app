require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke

    # DRY address/phone Faker data
    street       = Faker::Address.street_address
    city         = Faker::Address.city
    state        = Faker::Address.state_abbr
    zip          = Faker::Address.zip
    country      = Faker::Address.country_code
    area_code    = Faker::Number.number(3)
    phone_number = Faker::Number.number(7)

    # Seed Person
    20.times do |n|
      lastname  = Faker::Name.last_name
      firstname = Faker::Name.first_name
      mi        = Faker::Lorem.characters(1)
     
      Person.create!(
                     :lastname     => lastname,
                     :firstname    => firstname,
                     :mi           => mi,
                     :street       => street,
                     :city         => city,
                     :state        => state,
                     :zip          => zip,
                     :area_code    => area_code,
                     :phone_number => phone_number
                    )
    end

    # Seed PayType
    names = [
             "Grunt", 
             "Troll", 
             "Super", 
             "unknown"
            ]
    wage  = [
             18000, 
             22000, 
             50000, 
             0
            ]
    4.times do |n|
      pay_type_name = names.pop
      minimum_wage  = wage.pop
     
      PayType.create!(
                      :pay_type_name => pay_type_name,
                      :minimum_wage  => minimum_wage
                     )
    end

    # Seed Employee
    counter = 1
    store   = 1
    supers  = [4,4,4,3,3,3,3,2,2,2,2,1,1,1,0]
    15.times do |n|
      supervisor_id     = supers.pop
      store_number      = 0

      if supers[supers.length-1] == 0
        store_number    = 0
      elsif supers[supers.length-1] == 1
         store_number   = store
         store = store + 1
      else
         store_number   = Employee.find(supervisor_id).store_number
      end

      person_id         = counter
      counter           = counter + 1
      pay_type_name     = ""

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

      pay_type          = PayType.where(pay_type_name: pay_type_name).first
      pay_amount        = pay_type.minimum_wage + (10000 * ((1.0+rand(10.0))/10.0))
      pay_type_code     = pay_type.id
      title             = pay_type_name
     
      Employee.create!(
                       :store_number  => store_number,
                       :person_id     => person_id,
                       :pay_type_code => pay_type_code,
                       :pay_amount    => pay_amount,
                       :title         => title,
                       :supervisor_id => supervisor_id 
                      )
    end

    # Seed OrderHeader
    50.times do |n|
      invoice_number = Faker::Number.number(6)
      store_number   = 1+rand(10)
      person_id      = 1+rand(20)
      account_number = 1+rand(20)
      amount_due     = Faker::Commerce.price
      
      OrderHeader.create!(
                          :invoice_number => invoice_number,
                          :store_number   => store_number,
                          :person_id      => person_id,
                          :account_number => account_number,
                          :amount_due     => amount_due
                         )
    end

    # Seed OrderItem
    200.times do |n|
      invoice_number = OrderHeader.find(1+rand(50)).invoice_number
      product_id     = 1+rand(50)
      quantity       = Faker::Number.number(1)
      discount       = Faker::Number.between(25,50)
      
      OrderItem.create!(
                        :invoice_number => invoice_number,
                        :product_id       => product_id,
                        :quantity         => quantity,
                        :discount         => discount
                       )
    end

    # Seed AccountType
    discount = [10,25]
    account_type_names = [
                          "loyalty", 
                          "friend"
                         ]
    2.times do |n|
      account_type_code = account_type_names[account_type_names.length-1][0..2].capitalize
      account_type_name = account_type_names.pop
      initial_discount  = discount.pop
      
      AccountType.create!(
                          :account_type_code => account_type_code,
                          :account_type_name => account_type_name,
                          :initial_discount  => initial_discount
                         )
    end

    # Seed Account
    10.times do |n|
      customer_id       = Faker::Number.between(1,20)
      person            = Person.find(customer_id)
      account_name      = person.lastname[0..2].capitalize
      account_type_code = 1+rand(2)
      credit_limit      = 10000
      balance           = 0
      account_street    = person.street
      account_city      = person.city
      account_state     = person.state
      
      Account.create!(
                      :account_name      => account_name,
                      :account_type_code => account_type_code,
                      :customer_id       => customer_id,
                      :credit_limit      => credit_limit,
                      :balance           => balance,
                      :street            => account_street,  
                      :city              => account_city,
                      :state             => account_state
                     )
    end

    # Seed ProductCategory
    product_category_names = [
                              "bed",
                              "bath",
                              "kitchen",
                              "garage",
                              "living",
                              "dining"
                             ]
    6.times do |n|
      product_category_code = 
        product_category_names[product_category_names.length-1][0..2].capitalize
      product_category_name = product_category_names.pop
     
      ProductCategory.create!(:product_category_code => product_category_code,
                              :product_category_name => product_category_name
                             )
    end

    # Seed Vendor
    5.times do |n|
      name = Faker::Company.name
      vendor_rep_id = 1+rand(20)
     
      Vendor.create!(
                     :name          => name,
                     :vendor_rep_id => vendor_rep_id,
                     :street        => street,
                     :city          => city,
                     :state         => state,
                     :zip           => zip,
                     :country       => country,
                     :area_code     => area_code,
                     :phone_number  => phone_number
                    )
    end

    # Seed POHeader
    25.times do |n|
      vendor_id    = 1+rand(5)
      store_number = 1+rand(3)
      po_number    = Faker::Number.number(6)
      order_date   = Faker::Time.between(DateTime.now - 30, DateTime.now)
      tax_rate     = 4.8
      
      POHeader.create!(
                       :vendor_id    => vendor_id,
                       :store_number => store_number,
                       :order_date   => order_date,
                       :po_number    => po_number,
                       :order_date   => order_date,
                       :tax_rate     => tax_rate
                      )
    end
 
    # Seed POItem
    250.times do |n|
      po_number  = POHeader.find(1+rand(25)).po_number
      quantity   = 1+rand(5)
      unit_cost  = Faker::Commerce.price
      product_id = 1+rand(50)
      
      POItem.create!(
                     :po_number  => po_number,
                     :quantity   => quantity,
                     :unit_cost  => unit_cost,
                     :product_id => product_id
                    )
    end
    
    # Seed Inventory
    store_counter = 1
    3.times do |n|
      product_counter = 1
      50.times do |n|
        product_id        = product_counter
        store_number      = store_counter
        quantity_on_hand  = Faker::Number.between(50,150)
        quantity_on_order = 0
        product_counter   += 1
       
        Inventory.create!(
                          :product_id        => product_id,
                          :store_number      => store_number,
                          :quantity_on_hand  => quantity_on_hand,
                          :quantity_on_order => quantity_on_order
                         )
      end
      store_counter += 1
    end

    # Seed Store
    store_number_counter = 1
    3.times do |n|
      manager_id     = Employee.where(title: "Troll", store_number: store_number_counter).first
      sales_tax_rate = Faker::Number.decimal(1)
      store_number_counter += 1
      
      Store.create!(
                    :manager_id     => manager_id,
                    :street         => street,
                    :city           => city,
                    :state          => state,
                    :zip            => zip,
                    :area_code      => area_code,
                    :phone_number   => phone_number,
                    :sales_tax_rate => sales_tax_rate
                   )
    end

    # Seed Product --> this needs to seed last, it has the most dependencies
    50.times do |n|
      description       = Faker::Lorem.sentence
      price             = Faker::Commerce.price
      reorder_threshold = Faker::Number.number(2)
     
      Product.create!(
                      :description => description,
                      :price => price,
                      :reorder_threshold => reorder_threshold
                     )
    end
  end
end
