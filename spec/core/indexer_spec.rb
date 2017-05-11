require 'spec_helper'
require 'pry'
require 'nokogiri'
require_relative '../../app/core/indexer'

describe Indexer do

  it 'finds all of the <h1> in an HTML doc' do
    file = File.read('./spec/core/mashable_article.html')
    indexed = Indexer.new(file)
    expect(indexed.h1_tags).to include("Mashable")
    expect(indexed.h1_tags).to include("'King Arthur: Legend of the Sword' is two movies in one, and one is way better than the other")

    file = File.read('./spec/core/bbc_article.html')
    indexed = Indexer.new(file)
    expect(indexed.h1_tags).to include("Arctic summit: Alaskan fears amid the vanishing ice")
  end

end
