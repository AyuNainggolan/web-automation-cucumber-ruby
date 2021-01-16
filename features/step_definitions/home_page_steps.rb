Given("user access homepage tiket.com") do
  @browser = HomePage.new
  @browser.load

  @browser.wait_until_login_button_visible(wait: 20)
  expect(@browser).to have_logo
  expect(@browser).to have_text('Mau ke mana?')
  expect(@browser).to have_product_widget
end

Then("home page will have displayed") do
	@browser = HomePage.new

	@browser.wait_until_product_widget_visible(wait: 20)
	expect(@browser).to have_banner_container
	expect(@browser).to have_logo
	expect(@browser).to have_text('My Order')
	expect(@browser).to have_product_widget
end

When(/^user choose "([^"]*)" product$/) do |menu|
	@browser = HomePage.new

	@browser.choose_product_menu(menu)
end

