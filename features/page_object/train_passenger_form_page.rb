class TrainPassengerFormPage < SitePrism::Page
	element :count_down_pesanan, '.booking-timer'
	element :buyer_title_dropdown, :xpath, "(//label[text()='Titel']/parent::div)[1]"
	element :title_mr, :xpath, "//div[text()='Tuan']"
	element :buyer_name_input, :xpath, "(//input[@name='fullName'])[1]"
	element :buyer_email_input, :xpath, "(//input[@name='emailAddress'])[1]"
	element :buyer_phone_input, :xpath, "(//input[@name='phone'])[1]"

	element :passenger_title_dropdown, :xpath, "(//label[text()='Titel']/parent::div)[2]"
	element :passenger_name_input, :xpath, "(//input[@name='fullName'])[2]"
	element :passenger_identity_input, :xpath, "(//input[@name='identityNumber'])[1]"

	element :infant_name, :xpath, "(//input[@name='fullName'])[3]"
	element :infant_title_dropdown, :xpath, "(//label[text()='Titel']/parent::div)[3]"
	element :infant_birthdate, '.input-date'

	element :button_continue, :xpath, "//button[text()='LANJUTKAN KE PEMBAYARAN']"
	element :button_choose_seating, '.btn-choose-seat'

	def input_infant_data
		return unless has_infant_name?

		infant_name.send_keys(ENV['INFANT_NAME'])
		infant_title_dropdown.click
		title_mr.click
		sleep 2
		input_birthdate
	end

	def input_birthdate
		elm = "//div[@class='option-list']"

		infant_birthdate.click
		sleep 3
		find(:xpath, elm, text: "1", match: :first).click
		sleep 3
		find(:xpath, elm, text: "Mar", match: :first).click
		sleep 3
		find(:xpath, elm, text: "2018", match: :first).click
	end
end


