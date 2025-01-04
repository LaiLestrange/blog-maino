require 'rails_helper'

describe 'Blogger edits post' do
  it 'successfully' do
    blogger = create(:blogger)
    post = create(:post, blogger: blogger, text: 'original text')

    login_as blogger
    visit post_path(post)
    find('.edit-post-btn').click
    fill_in 'Post', with: 'edited text'
    click_on 'Atualizar'

    expect(current_path).to eq post_path(post)
    expect(page).not_to have_content 'original text'
    expect(page).to have_content 'edited text'
    expect(page).to have_content 'Post editado com sucesso!'
    expect(page).to have_content '(Editado)'
  end
end
