require 'rails_helper'

describe 'Blogger creates post' do
  it 'successfully' do
    blogger = create(:blogger)
    login_as blogger

    visit root_path
    find('.new-post-btn').click
    fill_in 'post_text', with: 'E aí pessoal! Esse é meu primeiro post!'
    find('.submit-post-btn').click

    expect(page).to have_content 'E aí pessoal! Esse é meu primeiro post!'
    expect(page).to have_content 'Postado com sucesso!'
    expect(page).not_to have_button 'Postar'
  end
end

describe 'Blogger cant create post' do
  it 'longer than 140 characters' do
    blogger = create(:blogger)
    login_as blogger

    text_longer_than_140char = 'char' * 140

    visit root_path
    find('.new-post-btn').click
    fill_in 'post_text', with: text_longer_than_140char
    find('.submit-post-btn').click

    expect(page).to have_content 'Não foi possível postar!'
    expect(page).to have_content 'Use apenas 140 caracteres!'
  end
end
