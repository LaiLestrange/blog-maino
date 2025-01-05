require 'rails_helper'

describe 'Visitor views home page' do
  it 'and sees latest posts' do
    create(:post, text: 'um post para aparecer na home_page')

    visit root_path

    expect(page).to have_content('Blog Mainô')
    expect(page).to have_content('Posts mais recentes')
    expect(page).to have_content('um post para aparecer na home_page')
  end

  it 'and sees 3 posts per page' do
    create_list(:post, 14, text: 'posts para paginação')

    visit root_path
    within '.pagination' do
      click_link 'última'
    end

    expect(page).to have_css('.feed-post', count: 2)
  end
end
