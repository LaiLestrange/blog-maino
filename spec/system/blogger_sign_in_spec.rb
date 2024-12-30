require 'rails_helper'

describe 'Blogger signs in' do
  it 'successfully' do
    blogger = create(:blogger,
                     email: 'test_blogger@email.com',
                     password: 'p4ssw0rd',
                     username: 'blogger07')

    visit root_path
    click_on 'Entrar'
    within '.sign-in-form' do
      fill_in 'E-mail', with: 'test_blogger@email.com'
      fill_in 'Senha', with: blogger.password
      click_on 'Entrar'
    end

    expect(page).to have_content 'blogger07'
    expect(page).to have_button 'Sair'
    expect(page).not_to have_link 'Entrar'
  end

  it 'and logs out' do
    blogger = create(:blogger)

    login_as blogger, scope: :blogger
    visit root_path
    click_on 'Sair'

    expect(page).to have_content 'Logout efetuado com sucesso.'
    expect(page).to have_link 'Entrar'
    expect(page).not_to have_button 'Sair'
  end
end
