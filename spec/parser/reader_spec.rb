require 'spec_helper'

describe Parser::Reader do
  # bit silly but as we have some example data
  # we can use it in tests
  #let(:reader) {Parser::Reader.new("data/webserver.log")}
  describe "#unique_and_page_views" do
    before(:all) do
      @reader = Parser::Reader.new("data/webserver.log")
      @reader.send(:read)
      @reader.send(:unique_and_page_views)
    end
    it "should return set data and return where keys urls and values are ip addresses" do
      expect(@reader.data.class).to be(Hash)
    end
    it "data should return keys like" do
      expect(@reader.data.keys.sort).to eq(["/about", "/about/2", "/contact", "/help_page/1", "/home", "/index"])
    end
    it "for key /about it should have 81 ip addresses" do
      expect(@reader.data['/about'].count).to eq(81)
    end
    it "should return for key /about fallowing first 10 ip addresses" do
      arr = ["061.945.150.735", "126.318.035.038", "235.313.352.950", "336.284.013.698", "715.156.286.412", "715.156.286.412", "715.156.286.412", "722.247.931.582", "836.973.694.403", "929.398.951.889"]
      expect(@reader.data['/about'][0...10].sort).to eq(arr)
    end
  end

  describe "#collect(line)" do
    before(:all) do
      @parser = Parser::Reader.new("")
      @parser.send(:collect, "/help_page/1 126.318.035.038\n")
    end
    it "should feed the data attribute which returns hash" do
      expect(@parser.data.class).to be(Hash)
    end
    it "should have key for /help_page/1 entry " do
      expect(@parser.data.has_key?("/help_page/1")).to be true
    end
    it "value for help_page key should be array" do
      expect(@parser.data["/help_page/1"].class).to be(Array)
    end
  end

  describe "#return_data" do
    before(:all) do
      @parser = Parser::Reader.new("")
      @parser.send(:collect, "/help_page/1 126.318.035.038\n")
    end
    it "should return hash from unique_pages and page_views" do
      allow(@parser).to receive(:read).and_return(nil)
      allow(@parser).to receive(:unique_and_page_views).and_return(nil)
      @parser.instance_variable_set(:@unique_pages, "unique_pages")
      @parser.instance_variable_set(:@page_views, "page_views")
      expect(@parser.return_data).to eq({:pages=>"page_views", :unique=>"unique_pages"})
    end
  end

end
