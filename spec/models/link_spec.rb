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
end
