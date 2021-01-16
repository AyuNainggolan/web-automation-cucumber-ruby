When(/^user is on Kereta Api page$/) do
	@browser = TrainSearchPage.new

	@browser.load
end

When(/^user search train "([^"]*)" schedule with passenger$/) do | trip_type, passenger_data |
	@browser = TrainSearchPage.new
	
	@browser.skip_coachmark
	@browser.wait_until_train_search_form_visible(wait: 20)
	expect(@browser).to have_text('Cari, Reservasi & Pesan Tiket Kereta Api KAI Online')
	passenger_data = passenger_data.hashes

	@browser.choose_station
	@browser.choose_trip_date(trip_type)
	@browser.choose_passenger(passenger_data)
	@browser.button_done.click
	@browser.button_search_schedule.click
end

Then(/^list of "([^"]*)" train schedule should be displayed$/) do |trip|
	@browser = TrainSchedulePage.new

	@browser.skip_coachmark
	expect(@browser).to have_schedule_card
	if trip == "departure"
		expect(@browser).to have_text('Pilih Kereta Pergi')
	else
		expect(@browser).to have_text('Pilih Kereta Pulang')
	end
end

When("user choose train schedule") do
	@browser = TrainSchedulePage.new

	@browser.button_pilih.first.click
end

When("user fill train buyer and passenger form") do
	@browser = TrainPassengerFormPage.new

	@browser.wait_until_count_down_pesanan_visible(wait:20)
	expect(@browser).to have_text('Detail Pemesan')
	expect(@browser).to have_text('Detail Penumpang')

	# Fill Buyer Info
	@browser.buyer_title_dropdown.click
	@browser.title_mr.click
	@browser.buyer_name_input.send_keys(ENV['BUYER_NAME'])
	@browser.buyer_email_input.send_keys(ENV['BUYER_EMAIL'])
	@browser.buyer_phone_input.send_keys(ENV['BUYER_PHONE'])

	# Fill Passenger Adult Data
	@browser.passenger_title_dropdown.click
	@browser.title_mr.click
	@browser.passenger_name_input.send_keys(ENV['PASSENGER_NAME'])
	@browser.passenger_identity_input.send_keys(ENV['PASSENGER_IDENTITY'])

	@browser.input_infant_data
	

	@browser.button_choose_seating.click
end

When("user choose seating") do
	@browser = TrainSeatingPage.new

	expect(@browser).to have_text('Pilih Kursi')
	expect(@browser).to have_wagon_layout
	@browser.available_seat.first.click
	@browser.button_continue.click

	expect(@browser).to have_button_yes_continue
	@browser.button_yes_continue.click
end