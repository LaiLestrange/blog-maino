require 'rails_helper'

describe 'Blogger edits post' do
  it 'successfully' do
    blogger = create(:blogger)
    post = create(:post, blogger: blogger, text: 'original text')

    login_as blogger
    visit post_path(post)
    find('.edit-post-btn').click
    fill_in 'post_text', with: 'edited text'
    find('.submit-post-btn').click

    expect(current_path).to eq post_path(post)
    expect(page).not_to have_content 'original text'
    expect(page).to have_content 'edited text'
    expect(page).to have_content 'Atualizado com sucesso!'
    expect(page).to have_css '.edited-icon'
  end
end

describe 'Blogger cant edit post' do
  it 'with more than 140 characters' do
    blogger = create(:blogger)
    post = create(:post, blogger: blogger, text: 'A text that is smaller than 140 characters')

    text_longer_than_140char = 'char' * 140

    login_as blogger
    visit edit_post_path(post)
    fill_in 'post_text', with: text_longer_than_140char
    find('.submit-post-btn').click

    expect(page).to have_content 'Não foi possível atualizar!'
    expect(page).to have_content 'Use apenas 140 caracteres!'
  end
end
