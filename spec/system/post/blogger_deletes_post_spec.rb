require 'rails_helper'

describe 'Blogger deletes post' do
  it 'from the post page', js: true do
    blogger = create(:blogger)
    post = create(:post, blogger: blogger, text: 'original text')

    login_as blogger
    visit post_path(post)
    accept_confirm do
      find('#delete-post-btn', visible: :all).trigger('click')
    end

    expect(page).to have_content 'Post deletado com sucesso!'
  end
end

describe 'Blogger deletes post' do
  it 'from the edit_post page', js: true do
    blogger = create(:blogger)
    post = create(:post, blogger: blogger, text: 'original text')

    login_as blogger
    visit edit_post_path(post)
    accept_confirm do
      click_on 'Deletar'
    end

    expect(page).to have_content 'Post deletado com sucesso!'
  end
end
