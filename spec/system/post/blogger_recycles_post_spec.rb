require 'rails_helper'

describe 'Blogger recycles post' do
  it 'from the post page' do
    blogger = create(:blogger)
    post = create(:post, blogger: blogger, text: 'Post que será reciclado', status: :deleted)

    login_as blogger
    visit post_path(post)
    find('.recycle-post-btn').click

    expect(current_path).to eq post_path(post)
    expect(page).to have_content 'Post reciclado com sucesso!'
    expect(page).to have_content 'Post que será reciclado'
    expect(page).to have_css '.delete-post-btn'
  end
end

describe 'Blogger tries to recycle post' do
  it 'but it was not deleted' do
    blogger = create(:blogger)
    post = create(:post, blogger: blogger, text: 'Post que não precisa ser reciclado')

    login_as blogger
    visit recycle_post_path(post)

    expect(current_path).to eq recycle_post_path(post)
    expect(page).to have_content 'Post não precisa ser reciclado!'
  end
end
