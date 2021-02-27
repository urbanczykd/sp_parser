#!/usr/bin/ruby

class Parser
  def initialize(path)
    @path = path || ""
  end

  def parse
    if File.exist?(@path) && @path.include?(".log")
      data = Parser::Reader.new(@path).return_data
      Parser::Printer.new(data).print
    else
      raise ArgumentError.new("The file do not have .log extension, or it doens not exist.")
    end
  end
end
require_relative 'lib/parser/reader'
require_relative 'lib/parser/printer'

# small trick to avoid calling it
# from tests
# spec helper is setting this variable

Parser.new(ARGV[0]).parse if !defined?(RUBY_ENV) || RUBY_ENV!="test"
