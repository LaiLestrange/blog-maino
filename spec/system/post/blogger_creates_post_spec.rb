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

describe 'Blogger cant create post' do
  it 'longer than 140 characters' do
    blogger = create(:blogger)
    login_as blogger

    text_longer_than_140char = <<~TEXT
      Lorem ipsum dolor sit amet, consectetur adipiscing elit.
      Donec commodo, est non euismod auctor, arcu lorem semper nibh,
      eu mattis felis enim quis dui.
    TEXT

    visit root_path
    find('.new-post-btn').click
    fill_in 'post_text', with: text_longer_than_140char
    click_on 'Postar'

    expect(page).to have_content 'Não foi possível postar!'
    expect(page).to have_content 'Use apenas 140 caracteres!'
  end
end
