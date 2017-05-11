require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "POST #create" do
    context "with valid URL" do
      it "creates a new Page" do
        url = 'http://mashable.com/2017/05/11/apple-secret-berlin-office/?utm_cid=hp-r-1#zXba4JvrOkqE'
        expect {
          post :create, params: { url: url }
        }.to change(Page, :count).by(1)
      end
    end

    context 'with invalid URL' do
      it 'catches the error and renders appropriate message' do
        url = '/a-whole-bunch-a-nothin/'
        post :create, params: { url: url }
        expect(JSON.parse(response.body)['message']).to eq('The URL you provided returned no results.')
      end
    end
  end

end
