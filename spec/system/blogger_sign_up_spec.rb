require 'rails_helper'

describe 'Blogger signs up' do
  it 'successfully' do
    visit root_path
    click_on 'Login'
    click_on 'Cadastrar-se'
    fill_in 'Usuário', with: 'talsfulano'
    fill_in 'Nome', with: 'Fulano de Tal'
    fill_in 'E-mail', with: 'fulano@tal.com'
    fill_in 'Senha', with: 'p4ssw0rd'
    fill_in 'Confirmar senha', with: 'p4ssw0rd'
    click_on 'Criar conta'

    expect(page).to have_content 'Bem vindo, Fulano de Tal! Sua conta foi criada com sucesso!'
    expect(page).to have_content 'Fulano de Tal'
    expect(page).to have_content 'fulano@tal.com'
    expect(page).to have_content 'talsfulano'
    expect(page).to have_button 'Sair'
  end
end
