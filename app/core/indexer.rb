class Indexer

  attr_reader :document

  def initialize(html)
    @document = Nokogiri::HTML(html)
  end

  def h1_tag_contents
    @h1_tag_contents ||= find_content('h1')
  end

  def h2_tag_contents
    @h2_tag_contents ||= find_content('h2')
  end

  def h3_tag_contents
    @h3_tag_contents ||= find_content('h3')
  end

  def links
    @links ||= document.css('a').map do |link|
      { content: link.content, href: link.attr('href') }
    end
  end

  private

  def find_content(tag)
    document.css(tag).map(&:content)
  end

end
