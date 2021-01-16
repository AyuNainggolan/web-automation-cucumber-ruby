class FlightPassengerFormPage < SitePrism::Page
	element :count_down_pesanan, '.countdown-desktop__description'
	element :buyer_title_dropdown, '.contact-person-dropdown'
	element :title_mr, :xpath, "//div[text()='Tuan']"
	element :buyer_name_input, :xpath, "(//div[text()='Nama Lengkap'])[1]/preceding-sibling::input"
	element :buyer_email_input, :xpath, "(//div[text()='Alamat Email'])[1]/preceding-sibling::input"
	element :buyer_phone_input, :xpath, "(//div[text()='Nomor Telepon'])[1]/preceding-sibling::input"
	element :passenger_title_dropdown, '.flight-dropdown.title-dropdown'
	element :passenger_name_input, :xpath, "(//div[text()='Nama Lengkap'])[2]/preceding-sibling::input"
	element :passenger_nationality_input, :xpath, "(//div[text()='Kewarganegaraan'])/following-sibling::input"
	element :indonesia_nationality, :xpath, "//div[text()='Indonesia']"
	element :button_continue, :xpath, "//button[text()='LANJUTKAN KE PEMBAYARAN']"
	element :button_yes_continue, :xpath, "//button[text()='YA, LANJUTKAN']"
end