require 'rails_helper'

describe 'Visitor sees post page' do
  it 'from home page' do
    posts = create_list(:post, 4, text: 'texto do feed')
    post = posts[2]
    post.update!(text: 'texto do show')

    visit root_path
    click_on 'texto do show'

    expect(page).to have_content 'texto do show'
    expect(page).not_to have_content 'texto do feed'
    expect(current_path).to eq post_path(post)
  end
end
