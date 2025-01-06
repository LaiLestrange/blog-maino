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
    expect(page).to have_current_path(root_path)
  end
end

describe 'Blogger changes their password' do
  it 'from the home page' do
    blogger = create(:blogger, password: 'senha123')

    login_as blogger
    visit root_path
    find('.edit-profile-btn').click
    find('.edit-password-btn').click
    fill_in 'Senha atual', with: 'senha123'
    fill_in 'Nova senha', with: 'p4ssw0rd'
    fill_in 'Confirmar nova senha', with: 'p4ssw0rd'
    click_button 'Redefinir senha'

    expect(page).to have_content('Sua senha foi redefinida com sucesso!')
  end
end

describe 'Blogger cant change their password' do
  it 'current passowrd is wrong' do
    blogger = create(:blogger, password: 'senha123')

    login_as blogger
    visit edit_blogger_registration_path
    fill_in 'Senha atual', with: 'ERRADA'
    fill_in 'Nova senha', with: 'p4ssw0rd'
    fill_in 'Confirmar nova senha', with: 'p4ssw0rd'
    click_button 'Redefinir senha'

    expect(page).to have_content('Senha atual inválida!')
  end
  it 'new password and confirmation doesnt match' do
    blogger = create(:blogger, password: 'senha123')

    login_as blogger
    visit edit_blogger_registration_path
    fill_in 'Senha atual', with: 'senha123'
    fill_in 'Nova senha', with: 'SENHA123'
    fill_in 'Confirmar nova senha', with: 'NAOCOMBINA'
    click_button 'Redefinir senha'

    expect(page).to have_content('Confirmação de senha não combina!')
  end
end
