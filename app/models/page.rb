# == Schema Information
#
# Table name: pages
#
#  id              :integer          not null, primary key
#  url             :string
#  h1_tag_contents :text
#  h2_tag_contents :text
#  h3_tag_contents :text
#  links           :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Page < ApplicationRecord

  serialize :h1_tag_contents, Array
  serialize :h2_tag_contents, Array
  serialize :h3_tag_contents, Array
  serialize :links, Array

  validates_presence_of :url

end
