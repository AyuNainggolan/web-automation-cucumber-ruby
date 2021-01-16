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
