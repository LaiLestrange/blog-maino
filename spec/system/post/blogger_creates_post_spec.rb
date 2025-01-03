require 'rails_helper'

describe 'Blogger creates post' do
  it 'successfully' do
    blogger = create(:blogger)
    login_as blogger

    visit root_path
    click_on 'Novo post'
    fill_in 'post', with: 'E aí pessoal! Esse é meu primeiro post!'
    click_on 'Enviar'
    save_and_open_page

    expect(page).to have_content 'E aí pessoal! Esse é o meu primeiro post!'
    expect(page).to have_content 'Postado com sucesso!'
    expect(page).not_to have_button 'Enviar'
  end
end
