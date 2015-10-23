namespace :db do
  desc "Fill database with sample data"
  task :seed_xml => :environment do
  	Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
  	path = './lib/tasks/seed.xml'

  	# while root, read into hash object
  	# when root closes, use root to create class?
  	xml = ""
  	File.open(path, 'r') do |f|
  		f.each_line do |line|
  			xml += line
  		end
  	end

    #create hash_object from the xml
  	hash_object = Hash.from_xml(xml)
    # call create on an object, pass all of the person elements from the converted
    # xml to be created
    # repeat this with all objects
    Person.create(hash_object["people"]["person"])
  	


  end
end