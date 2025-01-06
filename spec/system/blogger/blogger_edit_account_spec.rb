require 'rails_helper'

describe 'Blogger edits account' do
  it 'successfully' do
    blogger = create(:blogger, username: 'blogger2024')

    login_as blogger
    visit root_path
    find('.edit-profile-btn').click
    fill_in 'Usuário', with: 'gossiper2025'
    fill_in 'Senha atual', with: blogger.password
    click_on 'Atualizar'

    expect(page).to have_content 'Cadastro atualizado com sucesso'
    expect(page).to have_content 'gossiper2025'
  end

  it 'but does not provide current password' do
    blogger = create(:blogger, username: 'blogger2024')

    login_as blogger
    visit root_path
    find('.edit-profile-btn').click
    fill_in 'Usuário', with: 'gossiper2025'
    click_on 'Atualizar'

    expect(page).to have_content 'Não foi possível salvar'
    expect(page).to have_content 'blogger2024'
  end
end
