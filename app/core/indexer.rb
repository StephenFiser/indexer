class Indexer

  attr_reader :document

  def initialize(html)
    @document = Nokogiri::HTML(html)
  end

  def h1_tags
    @h1_tags ||= document.css('h1').map(&:content)
  end

end
