require 'rails_helper'

RSpec.describe Link, type: :model do
  context 'validations' do
    scenario 'link is invalid without a url' do
      link = Link.create(url: nil)
      expect(link).to be_invalid
    end

    scenario 'link is valid with a url' do
      link = Link.create(url: 'https://www.someurl.com')
      expect(link).to be_valid
    end
  end

  context '#top_ten' do
    xscenario 'returns the top ten links' do
      create_list(:link, 10)
      link_collection = Link.top_ten
      expect(link_collection.count).to eq(10)
    end
  end
end
