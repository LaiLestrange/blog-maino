require 'rails_helper'

describe 'Blogger signs up' do
  it 'successfully' do
    visit root_path
    click_on 'Entrar'
    click_on 'Cadastrar-se'
    fill_in 'Usuário', with: 'talsfulano'
    fill_in 'Nome', with: 'Fulano de Tal'
    fill_in 'E-mail', with: 'fulano@tal.com'
    fill_in 'Senha', with: 'p4ssw0rd'
    fill_in 'Confirme a senha', with: 'p4ssw0rd'
    click_on 'Cadastrar-se'

    expect(page).to have_content 'Cadastro realizado com sucesso.'
    expect(page).to have_content 'talsfulano'
    expect(page).to have_button 'Sair'
    expect(page).not_to have_button 'Entrar'
  end

  it 'without valid information' do
    create(:blogger, username: 'blogger05')

    visit new_blogger_registration_path
    fill_in 'Usuário', with: 'blogger05'
    fill_in 'E-mail', with: ''
    click_on 'Cadastrar-se'

    expect(page).to have_content 'Não foi possível salvar usuário'
    expect(page).to have_content 'E-mail não pode ficar em branco'
    expect(page).to have_content 'Usuário já está em uso'
  end
end
