require 'rails_helper'

describe 'Blogger edits account' do
  it 'successfully' do
    blogger = create(:blogger, username: 'blogger2024')

    login_as blogger
    visit edit_blogger_registration_path
    click_on 'blogger2024'
    fill_in 'Usuário', with: 'gossiper2025'
    fill_in 'Senha atual', with: blogger.password
    click_on 'Atualizar'

    expect(page).to have_content 'Cadastro atualizado com sucesso'
    expect(page).to have_content 'gossiper2025'
  end
end
