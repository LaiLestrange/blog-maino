require 'rails_helper'

describe 'Blogger creates post' do
  it 'successfully' do
    blogger = create(:blogger)
    login_as blogger

    visit root_path
    find('.new-post-btn').click
    fill_in 'post_text', with: 'E aí pessoal! Esse é meu primeiro post!'
    click_on 'Postar'

    post = Post.last
    time_posted = post.created_at
    formatted_date = I18n.l(time_posted, format: :custom)

    expect(page).to have_content 'E aí pessoal! Esse é meu primeiro post!'
    expect(page).to have_content 'Postado com sucesso!'
    expect(page).to have_content formatted_date
    expect(page).not_to have_button 'Postar'
  end
end
