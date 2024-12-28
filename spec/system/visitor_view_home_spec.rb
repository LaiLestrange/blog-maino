require 'rails_helper'

describe 'Visitor view home page' do
  it 'successfully' do
    visit root_path

    expect(page).to have_content('Blog Mainô')
  end
end
