class Indexer

  attr_reader :document

  def initialize(html)
    @document = Nokogiri::HTML(html)
  end

  def h1_tags
    @h1_tags ||= document.css('h1').map(&:content)
  end

  def h2_tags
    @h2_tags ||= document.css('h2').map(&:content)
  end

  def h3_tags
    @h2_tags ||= document.css('h3').map(&:content)
  end

end
