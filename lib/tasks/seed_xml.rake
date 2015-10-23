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

  	hash_object = Hash.from_xml(xml)
  	p hash_object


  end
end