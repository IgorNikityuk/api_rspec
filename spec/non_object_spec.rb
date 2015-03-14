require 'spec_helper'
require 'date'

describe "Non-existng objects within collection" do
    #Inserts items into collection before each test
    before :each do
        hash = [
            {:title => "Black Ranger", :due => Date.today.to_s},
            {:title => "Pink Ranger", :due => Date.today.to_s},
            {:title => "Blue Ranger", :due => Date.today.to_s},
            {:title => "Yellow Ranger", :due => Date.today.to_s},
            {:title => "Red Ranger", :due => Date.today.to_s},
        ]
        create_todos hash
    end
    
    # after all tests, delete all of the items
    after :all do
        delete_all
    end
    
    ## Test 01
    it "GET the collection" do
        
        r = HTTParty.get url("/todos/1")
        
        expect(r.code).to eq(404)
    end
    
    ## Test 02
    it "POST parameters to the collection" do
        title = "aaron"
        due_date = "1991-07-21"
        
        r = HTTParty.post url("/todos/1"),
            :query => {:title => title, :due => due_date}
        
        expect(r.code).to eq(405)
    end
    
    ## Test 03
    it "POST with no parameters" do
        r = HTTParty.post url("/todos/1")
        
        expect(r.code).to eq(405)
    end
    
    ## Test 04
    it "PUT with no parameters" do
        
        r = HTTParty.put url("/todos/1")
        
        expect(r.code).to eq(422)
    end
    
    ## Test 05
    it "PUT with both parameters" do
        title = "aaron"
        due_date = "1991-07-21"
        
        r = HTTParty.put url("/todos/1"),
            :query => {:title => title, :due => due_date}
        
        expect(r.code).to eq(404)
    end
    
    ## Test 06
    it "DELETE with no parameters" do
        
        r = HTTParty.delete url("/todos/1")
        
        expect(r.code).to eq(404)
    end
end