require 'rails_helper'

describe 'Blogger recovers their password' do
  it 'by getting an email with the instructions' do
    blogger = create(:blogger, password: 'senha123')

    visit root_path
    click_on 'Entrar'
    click_on 'Recuperar a senha'
    fill_in 'E-mail', with: blogger.email
    click_button 'Enviar instruções por e-mail'

    mail = ActionMailer::Base.deliveries.last
    token = mail.body.match(/reset_password_token=(\w+)/)[1]

    visit edit_blogger_password_path(reset_password_token: token)
    fill_in 'Nova senha', with: 'p4ssw0rd'
    fill_in 'Confirmar nova senha', with: 'p4ssw0rd'
    click_button 'Redefinir senha'

    expect(mail.to).to include(blogger.email)
    expect(mail.subject).to eq('Instruções de redefinição de senha')
    expect(page).to have_content('Sua senha foi redefinida com sucesso!')
  end
end

describe 'Blogger changes their password' do
  it 'from the home page' do
    blogger = create(:blogger, password: 'senha123')

    login_as blogger
    visit root_path
    find('.edit-profile-btn').click
    fill_in 'Nova senha', with: 'p4ssw0rd'
    fill_in 'Confirmar nova senha', with: 'p4ssw0rd'
    fill_in 'Sua senha atual para confirmar alterações', with: 'senha123'
    find('.submit-btn').click

    expect(page).to have_content('Cadastro atualizado com sucesso.')
  end
end

describe 'Blogger cant change their password' do
  it 'current passowrd is wrong' do
    blogger = create(:blogger, password: 'senha123')

    login_as blogger
    visit edit_blogger_registration_path
    fill_in 'Nova senha', with: 'p4ssw0rd'
    fill_in 'Confirmar nova senha', with: 'p4ssw0rd'
    fill_in 'Sua senha atual para confirmar alterações', with: 'ERRADA'
    find('.submit-btn').click

    expect(page).to have_content('Senha atual não é válido')
  end
  it 'new password and confirmation doesnt match' do
    blogger = create(:blogger, password: 'senha123')

    login_as blogger
    visit edit_blogger_registration_path
    fill_in 'Nova senha', with: 'SENHA123'
    fill_in 'Confirmar nova senha', with: 'NAOCOMBINA'
    fill_in 'Sua senha atual para confirmar alterações', with: 'senha123'
    find('.submit-btn').click

    expect(page).to have_content('Confirme a senha e Senha não combinam')
  end
end
