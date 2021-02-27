require 'spec_helper'

describe Parser::Printer do
  subject { Parser::Printer.new({:pages => {:"/contact" => 2, :"/about" => 3, :"/something" => 3}, :unique => {:'/something' => 22, :'/about' => 22, :"/countact" => 3}})}
  describe "#header_unique" do
    it "returns the header form unique page views with new line" do
      expect{subject.send(:header_unique)}.to output("> list of webpages with most unique page views also ordered\n").to_stdout
    end
  end
  describe "#header_all" do
    it "return header for all visits" do
      expect{subject.send(:header_all)}.to output("> list of webpages with most page views ordered from most pages views to less page views\n").to_stdout
    end
  end
  describe "#all_sorted from @data['pages']" do
    it "should sort all pages" do
      expect(subject.send(:all_sorted)).to eq([[:"/about", 3], [:"/something", 3], [:"/contact", 2]])
    end
  end
  describe "#unique_sorted from @data['unique']" do
    it "should sort all unique page_views" do
      expect(subject.send(:unique_sorted)).to eq([[:"/about", 22], [:"/something", 22], [:"/countact", 3]])
    end
  end
end
