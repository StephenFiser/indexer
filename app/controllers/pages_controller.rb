class PagesController < ApplicationController
  before_action :set_page, only: [:show, :update, :destroy]

  def index
    @pages = Page.all
    render json: @pages
  end

  def create
    IndexPage.new(self).run
  end

end
