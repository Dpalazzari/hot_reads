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
      @link.reload
      expect(@link.times_read).to eq(1)
      expect(raw_link['times_read']).to eq(1)
    end

    it 'returns json of an already created link with updated times_read = 1' do
      link = Link.create(url: 'https://www.github.com', times_read: 1)
      expect(link.times_read).to eq(1)
      posted_link = { url: 'https://www.github.com' }.to_json
      post "/api/v1/links", posted_link
      expect(response).to be_success
      raw_link = JSON.parse(response.body)
      link.reload
      expect(link.times_read).to eq(2)
      expect(raw_link['times_read']).to eq(2)
    end
  end

  context 'Get /api/v1/links/top_ten' do
    it 'returns json of the top ten links' do
      link = create(:link)
      Link.create(url: "somelink1", times_read: 1)
      Link.create(url: "somelink2", times_read: 2)
      Link.create(url: "somelink3", times_read: 3)
      Link.create(url: "somelink4", times_read: 4)
      Link.create(url: "somelink5", times_read: 5)
      Link.create(url: "somelink6", times_read: 6)
      Link.create(url: "somelink7", times_read: 7)
      Link.create(url: "somelink8", times_read: 8)
      Link.create(url: "somelink9", times_read: 9)
      Link.create(url: "somelink10", times_read: 10)

      get '/api/v1/links/top_ten'

      expect(response).to be_success

      raw_links = JSON.parse(response.body)
      expect(raw_links.count).to eq(10)
      expect(raw_links.first['times_read']).to be > raw_links[1]['times_read']
    end
  end
end
