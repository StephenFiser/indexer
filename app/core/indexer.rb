class Indexer

  attr_reader :document

  def initialize(html)
    @document = Nokogiri::HTML(html)
  end

  def h1_tags
    @h1_tags ||= find_content('h1')
  end

  def h2_tags
    @h2_tags ||= find_content('h2')
  end

  def h3_tags
    @h3_tags ||= find_content('h3')
  end

  private

  def find_content(tag)
    document.css(tag).map(&:content)
  end

end
