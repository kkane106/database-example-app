namespace :db do
  desc "Fill database with sample data"
  task :write_xml => :environment do
  classes = [
         Account.all, 
         AccountType.all, 
         Employee.all, 
         Inventory.all, 
         OrderHeader.all,
         OrderItem.all,
         PayType.all,
         Person.all,
         POHeader.all,
         POItem.all,
         Product.all,
         ProductCategory.all,
         Store.all,
         Vendor.all
        ]
    def create_path object
    	path = "./lib/assets/#{object.class.name.downcase}.xml"
      return path
    end

	  classes.each do |object_collection|

      File.open(create_path(object_collection.first), 'w') do |f|
        f.truncate(0)
  	  	f.write(object_collection.to_xml)
        f.close
      end
	  end
    
	end
end