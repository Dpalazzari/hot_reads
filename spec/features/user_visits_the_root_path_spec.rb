require 'rails_helper'

RSpec.describe "Root Path", type: :feature do
  scenario "unauthenticated user" do
    create_list(:link, 10)
    visit root_path
    expect(page).to have_content("Welcome to Hot reads!")
  end

  scenario 'Unauthenticated user sees the top ten links' do
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
    visit root_path
    expect(page).to have_link(Link.last.url)
    expect(page).to_not have_link(Link.first.url)
  end
end
