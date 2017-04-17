require 'rails_helper'

RSpec.describe 'Post link request', type: :request do
  context 'POST /api/v1/links' do
    before(:each) do
      @link = Link.create(url: 'https://www.twitch.tv')
    end

    it 'returns JSON of the created link' do
      new_link = { url: "https://www.youtube.com" }.to_json
      post "/api/v1/links", new_link
      expect(response).to be_success
      raw_link = JSON.parse(response.body)
      expect(raw_link.class).to eq(Hash)
    end

    it 'returns json of an already created link with updated times_read' do
      expect(@link.times_read).to eq(0)
      posted_link = { url: 'https://www.twitch.tv' }.to_json
      post "/api/v1/links", posted_link
      expect(response).to be_success
      raw_link = JSON.parse(response.body)
      expect(raw_link['times_read']).to eq(1)
    end
  end
end
