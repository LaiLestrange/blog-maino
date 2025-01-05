require 'rails_helper'

describe 'Visitor views home page' do
  it 'and sees latest posts' do
    create(:post, text: 'um post para aparecer na home_page')

    visit root_path

    expect(page).to have_content('Blog Mainô')
    expect(page).to have_content('Posts mais recentes')
    expect(page).to have_content('um post para aparecer na home_page')
  end
end
