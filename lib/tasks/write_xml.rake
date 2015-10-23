namespace :db do
  desc "Fill database with sample data"
  task :write_xml => :environment do
  	path = './lib/tasks/seed.xml'
  	File.open(path, 'w') do |file|
  		file.truncate(0)
  	end

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
  	File.open(path, 'a') do |f|					
  	  classes.each do |object_collection|
  	  	f.write(object_collection.to_xml)
  	  end
  	  f.close
  	end

	end
end