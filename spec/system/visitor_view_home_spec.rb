require 'rails_helper'

describe 'Visitor views home page' do
  it 'successfully' do
    visit root_path

    # byebug

    expect(page).to have_content('Blog Mainô')
  end
end
