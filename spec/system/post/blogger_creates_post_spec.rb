require 'rails_helper'

describe 'Blogger creates post' do
  it 'successfully' do
    blogger = create(:blogger)
    login_as blogger

    visit root_path
    find('.new-post-btn').click
    fill_in 'post_text', with: 'E aí pessoal! Esse é meu primeiro post!'
    click_on 'Postar'

    expect(page).to have_content 'E aí pessoal! Esse é meu primeiro post!'
    expect(page).to have_content 'Postado com sucesso!'
    expect(page).not_to have_button 'Postar'
  end
end
