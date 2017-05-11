require 'spec_helper'
require 'pry'
require 'nokogiri'
require_relative '../../app/core/indexer'

describe Indexer do

  it 'finds all of the <h1> in an HTML doc' do
    file = File.read('./spec/core/mashable_article.html')
    indexed = Indexer.new(file)
    expect(indexed.h1_tag_contents).to include("Mashable")
    expect(indexed.h1_tag_contents).to include("'King Arthur: Legend of the Sword' is two movies in one, and one is way better than the other")

    file = File.read('./spec/core/bbc_article.html')
    indexed = Indexer.new(file)
    expect(indexed.h1_tag_contents).to include("Arctic summit: Alaskan fears amid the vanishing ice")
  end

  it 'finds all of the <h2> in an HTML doc' do
    file = File.read('./spec/core/mashable_article.html')
    indexed = Indexer.new(file)
    expect(indexed.h2_tag_contents).to include("Entertainment")
    expect(indexed.h2_tag_contents).to include("WATCH: 10 movies that inspire serious costume envy")


    file = File.read('./spec/core/bbc_article.html')
    indexed = Indexer.new(file)
    expect(indexed.h2_tag_contents).to include("News navigation")
    expect(indexed.h2_tag_contents).to include("'Longer summers'")
  end

  it 'finds all of the <h3> in an HTML doc' do
    file = File.read('./spec/core/mashable_article.html')
    indexed = Indexer.new(file)
    expect(indexed.h3_tag_contents).to eq([])

    file = File.read('./spec/core/bbc_article.html')
    indexed = Indexer.new(file)
    expect(indexed.h3_tag_contents).to include("Alaskan fears amid the vanishing ice")
    expect(indexed.h3_tag_contents).to include("Trump voters' verdict on Comey firing")
  end

  it 'finds all of the links in an HTML doc' do
    file = File.read('./spec/core/mashable_article.html')
    indexed = Indexer.new(file)
    expect(indexed.links).to include({:content=>"Click Here to find out more.", :href=>"/cookie-policy/"})
    expect(indexed.links.count).to eq(85)

    file = File.read('./spec/core/bbc_article.html')
    indexed = Indexer.new(file)
    expect(indexed.links).to include({:content=>"Accessibility Help", :href=>"/accessibility/"})
    expect(indexed.links.count).to eq(203)
  end

end
