require 'rails_helper'

describe 'Blogger edits account' do
  it 'successfully' do
    blogger = create(:blogger,
                     username: 'blogger2024',
                     fullname: 'Blogger Girl')

    login_as blogger
    visit edit_blogger_registration_path
    click_on 'blogger2024'
    fill_in 'Nome', with: 'Gossip Girl xoxo'
    fill_in 'Usuário', with: 'gossiper2025'
    click_on 'Atualizar'

    expect(page).to have_content 'Cadastro atualizado com sucesso'
    expect(page).to have_content 'gossiper2025'
    expect(current_path).to eq blogger_path blogger
  end
end
