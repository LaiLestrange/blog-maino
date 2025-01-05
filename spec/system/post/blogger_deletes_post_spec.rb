require 'rails_helper'

describe 'Blogger deletes post' do
  it 'from the post page' do
    blogger = create(:blogger)
    post = create(:post, blogger: blogger, text: 'Post que será deletado')

    login_as blogger
    visit post_path(post)
    find('.delete-post-btn').click

    expect(page).to have_content 'Post deletado com sucesso!'
    expect(page).not_to have_content 'Post que será deletado'
  end
end

describe 'Blogger deletes post' do
  it 'from the edit_post page', js: true do
    blogger = create(:blogger)
    post = create(:post, blogger: blogger, text: 'Post que será deletado')

    login_as blogger
    visit edit_post_path(post)
    click_on 'Deletar'

    expect(page).to have_content 'Post deletado com sucesso!'
    expect(page).not_to have_content 'Post que será deletado'
  end
end
