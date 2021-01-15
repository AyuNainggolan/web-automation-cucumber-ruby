# frozen_string_literal: true

class HomePage < SitePrism::Page
  path = ENV['WEB_BASE_URL']
  set_url(path)
  
  element :logo, 'div.header-logo'
  element :login_button, :xpath, "//a[contains(text(), 'Login')]"
  element :product_widget, '#productWidget'
  elements :banner_container, '.slick-slide'
  element :flight_product_button, :xpath, "//span[contains(text(), 'Pesawat')]/parent::div[@class='product-box']"
end
