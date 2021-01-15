# frozen_string_literal: true

class LoginPage < SitePrism::Page
  element :input_email_field, :xpath, "//input[@name='username']"
  element :input_password_field, :xpath, "//input[@name='password']"
  element :button_continue, '.submitEmail'
  element :button_login, '.loginSubmitButton'
  elements :alternative_login_button, '.btn-signup'
  
end
