require 'rspec'
require 'httparty'
require 'pry'

#Configuration within RSpec to show colours
RSpec.configure do|config|
    config.color = true
    config.tty = true
    config.formatter = :documentation
end

#Methods used
#URL method that defines the website
def url(path)
    "http://lacedeamon.spartaglobal.com#{path}"
end

# Deletes all items in the collection
def delete_all
    all = HTTParty.get url("/todos/")
    all.each do |todo|
        HTTParty.delete url("/todos/" + todo["id"].to_s)
    end
end

#creates items within the collection to use for the testing
def create_todos(array)
    array.each do |item|
        HTTParty.post url("/todos/"), query: item
    end
end

#Pulls the id of an item within the collection
def get_id
    @id = HTTParty.get url("/todos/")
    @id.each do |todo|
        HTTParty.get url("/todos/" + todo["id"].to_s)
    end
end

