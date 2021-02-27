class Parser::Printer

  def initialize(data)
    @data = data
  end

  def print
    header_all
    all_sorted.each{|k, v| Kernel.print "#{k} #{v} "}
    puts ""
    header_unique
    unique_sorted.each{|k,v| puts "#{k} #{v} unique views" }
  end

  private

  def header_unique
    puts "> list of webpages with most unique page views also ordered"
  end

  def header_all
    puts "> list of webpages with most page views ordered from most pages views to less page views"
  end

  #-v just to avoind calling .reverse
  def all_sorted
    @data[:pages].sort_by{|k, v| -v}
  end
  # {|k,v| [-v, k]}
  # just to be sure that we will sort the visits
  # and later name
  def unique_sorted
    @data[:unique].sort_by{|k,v| [-v, k]}
  end

end
