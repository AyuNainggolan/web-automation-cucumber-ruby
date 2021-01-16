# frozen_string_literal: true

class HomePage < SitePrism::Page
  path = ENV['WEB_BASE_URL']
  set_url(path)
  
  element :logo, 'div.header-logo'
  element :login_button, :xpath, "//a[contains(text(), 'Login')]"
  element :product_widget, '#productWidget'
  elements :banner_container, '.slick-slide'
  element :flight_product_button, :xpath, "//span[contains(text(), 'Pesawat')]/parent::div[contains(@class, 'product-box')]"
  element :hotel_product_button, :xpath, "//span[contains(text(), 'Hotel')]/parent::div[contains(@class, 'product-box')]"
  element :train_product_button, :xpath, "//span[contains(text(), 'Kereta Api')]/parent::a[@class='product-box']"

  def choose_product_menu(menu)
  	case menu
		when "Tiket Pesawat"
		  flight_product_button.click
		when "Kereta Api"
		  train_product_button.click
		when "Hotel"
			hotel_product_button.click
		else
		  puts "Your choice is not implemented yet"
		end
  end
end
