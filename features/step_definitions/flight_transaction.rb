Given("user access homepage tiket.com") do
  @browser = HomePage.new
  @browser.load

  @browser.wait_until_login_button_visible(wait: 20)
  expect(@browser).to have_logo
  expect(@browser).to have_text('Mau ke mana?')
  expect(@browser).to have_product_widget
end

When("user login with valid credential") do
	@browser.login_button.click
  @browser = LoginPage.new
  
  # Assert Page
  @browser.wait_until_input_email_field_visible(wait: 20)
  expect(@browser).to have_text('Log in/Daftar')
  expect(@browser).to have_button_continue
  expect(@browser).to have_alternative_login_button

  # Login
  @browser.input_email_field.send_keys(ENV['USERNAME'])
  @browser.button_continue.click
  @browser.wait_until_input_password_field_visible(wait: 20)
  @browser.input_password_field.send_keys(ENV['PASSWORD'])
  @browser.button_login.click
end

Then("home page will have displayed") do
	@browser = HomePage.new

	@browser.wait_until_product_widget_visible(wait: 20)
	expect(@browser).to have_banner_container
	expect(@browser).to have_logo
	expect(@browser).to have_text('My Order')
	expect(@browser).to have_product_widget
end

When("user choose Tiket Pesawat product") do
	@browser = HomePage.new

	@browser.flight_product_button.click
end

When(/^user search flight "([^"]*)" "([^"]*)" schedule$/) do |category, trip_type|
	@browser = FlightSearchPage.new

	@browser.choose_trip(trip_type)
	@browser.choose_airport(category)

	expect(@browser).to have_text('Pilih tanggal pergi')
	@browser.choose_trip_date(trip_type)
	@browser.wait_until_button_done_visible(wait: 20)
	@browser.button_done.click
	@browser.button_search_schedule.click
end