require_dependency 'open-uri'

class IndexPage

  attr_reader :context

  def initialize(context)
    @context = context
  end

  def run
    begin
      url     = context.params[:url]
      file    = open(url)
      indexed = Indexer.new(file)
      page    = Page.create(indexed.to_h.merge(url: url))
      context.render json: { status: :ok, message: "Successfully indexed page.", page_id: page.id }
    rescue Errno::ENOENT
      context.render json: { status: :error, message: "The URL you provided returned no results." }
    end
  end

end
