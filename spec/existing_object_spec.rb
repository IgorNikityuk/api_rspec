require 'spec_helper'
require 'date'

describe "Existng objects within collection" do
    #before each tests create a set of items within the collection
    before :each do
        hash = [
            {:title => "Black Ranger", :due => Date.today.to_s},
            {:title => "Pink Ranger", :due => Date.today.to_s},
            {:title => "Blue Ranger", :due => Date.today.to_s},
            {:title => "Yellow Ranger", :due => Date.today.to_s},
            {:title => "Red Ranger", :due => Date.today.to_s},
        ]
        create_todos hash
        
        get_id
    end
    
    #after all of the tests are run, this will delete all of the items in the collection
    after :all do
        delete_all
    end
    
    
    ## Test 01
    it "GET an item" do
        
        r = HTTParty.get url("/todos/#{@id[0]["id"]}")
        
        expect(r.code).to eq(200)
    end
    
    ## Test 02
    it "POST to existing item with no parameters" do
        
        r = HTTParty.post url("/todos/#{@id[0]["id"]}"),
             :query => {}
        
        expect(r.code).to eq(405)
    end
    
    ## Test 03
    it "POST to existing item with parameters" do
        title = "Aaron"
        due_date = "1991-07-21"
        
        r = HTTParty.post url("/todos/#{@id[0]["id"]}"),
             :query => {:title => title, :due => due_date}
        
        expect(r.code).to eq(405)
    end
    
    ## Test 04
    it "PUT to existing item" do
        
        r = HTTParty.put url("/todos/#{@id[0]["id"]}"),
             :query => {}
        
        expect(r.code).to eq(422)
    end
    
    ## Test 05
    it "PUT to existing item with parameters" do
        title = "Aaron"
        due_date = "1991-07-21"
        r = HTTParty.put url("/todos/#{@id[0]["id"]}"),
             :query => {:title => title, :due => due_date}
    end
    
    ## Test 06
    it "DELETE to existing item" do
        
        r = HTTParty.delete url("/todos/#{@id[0]["id"]}"),
             :query => {}
        
        expect(r.code).to eq(204)
    end
    
    
end