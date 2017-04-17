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

  context '.top_ten' do
    scenario 'returns top ten links grouped by times_read' do
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

      links = Link.top_ten

      expect(links.count).to eq(10)
      
      expect(links.first.times_read).to be > links[1].times_read
      expect(links.last.times_read).to be < links[-2].times_read
    end
  end
end
