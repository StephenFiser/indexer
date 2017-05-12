module Api
  module V1
    class PagesController < ApplicationController
      before_action :set_page, only: [:show, :update, :destroy]

      def index
        pages = Page.paginate(page: params[:page], per_page: 30)
        render json: pages.as_json
      end

      def create
        IndexPage.new(self).run
      end

    end
  end
end
