require 'rails_helper'

describe 'Blogger views index with own posts' do
  it 'from the home page' do
    blogger1 = create(:blogger)
    blogger2 = create(:blogger)
    create(:post, blogger: blogger1, text: 'post 1')
    create(:post, blogger: blogger1, text: 'post 2')
    create(:post, blogger: blogger2, text: 'post 3')

    login_as blogger1

    visit root_path
    click_on blogger1.username

    expect(page).not_to have_content 'post 3'
    expect(page).to have_content 'post 2'
    expect(page).to have_content 'post 1'
    expect(page).to have_css 'a.edit-profile-btn'
  end
end

# describe 'Blogger views index with own posts' do
#   it 'from the home page' do
#     blogger1 = create(:blogger)
#     blogger2 = create(:blogger)
#     post1 = create(:post, blogger: blogger1, text: 'post 1')
#     post2 = create(:post, blogger: blogger1, text: 'post 2')
#     post3 = create(:post, blogger: blogger1, text: 'post 3')
#     post4 = create(:post, blogger: blogger1, text: 'post 4')
#     create_list(:post, 3, blogger: blogger2, text: 'post de outro blogueiro')

#     login_as blogger1

#     visit root_path
#     click_on blogger1.username

#     expect(page).to have_button ''
#     expect(page).to have_content ''
#     expect(page).to have_content ''
#     expect(page).to have_content ''
#     expect(page).to have_content ''
#     expect(page).to have_content ''
#   end
# end
