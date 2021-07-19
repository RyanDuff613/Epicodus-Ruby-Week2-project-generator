#!/usr/bin/ruby
puts "what should we call this project?"
project_name = gets.chomp
puts "what will you call your data model?"
model_name = gets.chomp
puts "thanks, I'll create your files now"

#create project folders
system "mkdir #{project_name}"
system "mkdir ./#{project_name}/lib ./#{project_name}/views ./#{project_name}/spec ./#{project_name}/public"

#create project files
system "touch ./#{project_name}/lib/#{model_name}.rb"
system "touch ./#{project_name}/views/layout.erb"
system "touch ./#{project_name}/spec/#{model_name}_spec.rb"
system "touch ./#{project_name}/spec/#{model_name}_integration_spec.rb"
system "touch ./#{project_name}/Gemfile"
system "touch ./#{project_name}/README.md"
system "touch ./#{project_name}/app.rb"

#append Gemfile with required gems (sinatra, rspec, pry)
system "echo 'source \"https://rubygems.org\"' >> ./#{project_name}/Gemfile"
system "echo 'gem \"sinatra\"' >> ./#{project_name}/Gemfile"
system "echo 'gem \"rspec\"' >> ./#{project_name}/Gemfile"
system "echo 'gem \"pry\"'  >> ./#{project_name}/Gemfile"
system "echo 'gem \"sinatra-contrib\"'  >> ./#{project_name}/Gemfile"


#append main project file with requirements for sinatra and pry gems
system "echo 'require(\"sinatra\")'  >> ./#{project_name}/app.rb"
system "echo 'require(\"sinatra/reloader\")'  >> ./#{project_name}/app.rb"
system "echo 'require(\"pry\")'  >> ./#{project_name}/app.rb"
system "echo 'also_reload(\"lib/**/.rb\")'  >> ./#{project_name}/app.rb"

#append test files with requirements for rspec and main project file
system "echo 'require(\"rspec\")' >> ./#{project_name}/spec/#{model_name}_spec.rb"
system "echo 'require(\"#{model_name}\")' >> ./#{project_name}/spec/#{model_name}_spec.rb"
system "echo 'require(\"rspec\")' >> ./#{project_name}/spec/#{model_name}_integration_spec.rb"
system "echo 'require(\"#{model_name}\")' >> ./#{project_name}/spec/#{model_name}_integration_spec.rb"
#bundle install
system "( cd ./#{project_name} && bundle install )"

puts "file structure complete"