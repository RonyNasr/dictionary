require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('the dictionary path', {:type => :feature}) do
  it ("goes to homepage") do
    visit('/')
    expect(page).to have_content("Content")
    click_link("Add a new word")
    expect(page).to have_content("Add a word here")
    fill_in("word", :with => "Cat")
    fill_in("definition", :with => "A furry animal")
    click_button("Add Word")
    expect(page).to have_content("Cat")
    click_link("Cat")
    expect(page).to have_content("A furry animal")
    click_link("Add Definition")
    expect(page).to have_content("Add a new definition for Cat")
    fill_in("definition", :with => "Always happy")
    click_button("Add definition")
    expect(page).to have_content("A furry animal Always happy")
    click_link("Return to dictionary")
    expect(page).to have_content("Content")
  end
end
