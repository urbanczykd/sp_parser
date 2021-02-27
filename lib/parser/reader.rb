class Parser::Reader

  attr_accessor :data

  def initialize(path)
    @path = path
    @data = {}
    @unique_pages = {}
    @page_views   = {}
  end

  def return_data
    read
    unique_and_page_views
    {:unique => @unique_pages, :pages => @page_views}
  end

  private

  def read
    File.readlines(@path).each do |line|
      collect(line)
    end
  end

  def collect(line)
    line = line.split(" ")
    key, value = line[0], line[1]
    @data[key] = (@data[key] ||= []).push(value)
  end

  # its together just to reduce iteration
  def unique_and_page_views
    @data.each do |key,value|
      @unique_pages[key] = value.uniq.count
      @page_views[key]   = value.count
    end
  end



end
