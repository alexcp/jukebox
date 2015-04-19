class ConcertListingScraper
  def initialize source="http://www.cheapthrills.ca/news.html"
    @source = source
  end

  def to_a
    scrape
  end

  private

  def scrape
    table_rows.map do |row|
      row.css("td font").map{|cell| cell.text.strip}
    end
  end

  def table_rows
    page.search("table table").css("tr").drop(1)
  end

  def page
    @page ||= agent.get(@source)
  end

  def agent
    @agent ||= Mechanize.new
  end
end
