require 'spec_helper'
require 'date'

describe "Empty Collection Todos Test" do
    #Deleting all items in the collection after all tests have been run
    after :all do
        delete_all
    end
    
    ## Test 01
    it "POST to collection with title" do
        title = "Romeo"
        
        r = HTTParty.post url("/todos"),
            :query => {:title => title}
        
        expect(r.code).to eq(422)
    end
    
    ## Test 02
    it "POST to collection with due date" do
        due_date = "09-10-2014"
        
        r = HTTParty.post url("/todos"),
            :query => {:due => due_date}
        
        expect(r.code).to eq(422)
    end
    
    ## Test 03
    it "POST to collection with title & due date" do
        title = "Romeo"
        due_date = "2014-10-09"
        
        r = HTTParty.post url("/todos"),
            :query => {:title => title, :due => due_date}
        
        expect(r.code).to eq(201)
        expect(r["title"]).to eq(title)
        expect(r["due"]).to eq(due_date)
    end
    
    ## Test 04
    it "POST with no params" do
        r = HTTParty.post url("/todos"),
            :query => {}
        
        expect(r.code).to eq(422)
    end
    
    ## Test 05
    it "GET the collection with nothing inside" do
        r = HTTParty.get url("/todos")
        
        expect(r.code).to eq(200)
    end
    
    ## Test 06
    it "PUT with no parameters" do        
        r = HTTParty.put url("/todos"),
            :query => {}
        
        expect(r.code).to eq(405)
    end
    
    ## Test 07
    it "DELETE with no parameters" do        
        r = HTTParty.delete url("/todos"),
            :query => {}
        
        expect(r.code).to eq(405)
    end
    
    
end