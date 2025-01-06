require 'rails_helper'

describe 'Blogger recovers their password' do
  it 'by getting an email with the instructions' do
    blogger = create(:blogger, password: 'senha123')

    visit root_path
    cick_on 'Entrar'
    cick_on 'Esqueci a senha'
    fill_in 'E-mail', with: blogger.email
    click_button 'Enviar instruções'

    mail = ActionMailer::Base.deliveries.last
    token = mail.body.match(/reset_password_token=(\w+)/)[1]
    visit edit_blogger_password_path(reset_password_token: token)
    fill_in 'Nova senha', with: 'p4ssw0rd'
    fill_in 'Confirmar nova senha', with: 'p4ssw0rd'
    click_button 'Redefinir senha'

    expect(mail.to).to include(blogger.email)
    expect(mail.subject).to eq('Instruções para resetar a senha')
    expect(page).to have_content('Sua senha foi redefinida com sucesso!')
    expect(page).to have_current_path(root_path)
  end
end
