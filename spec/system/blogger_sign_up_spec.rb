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
end
