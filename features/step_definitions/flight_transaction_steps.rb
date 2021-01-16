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

Then(/^list of "([^"]*)" flight schedule should be displayed$/) do |trip|
	@browser = FlightSchedulePage.new

	@browser.skip_coachmark
	expect(@browser).to have_schedule_card
	if trip == "departure"
		expect(@browser).to have_text('Pilih Penerbangan Pergi')
	else
		expect(@browser).to have_text('Pilih Penerbangan Pulang')
	end
end

When(/^user filter the schedule with "([^"]*)" transit$/) do |transit|
	@browser = FlightSchedulePage.new

	@browser.filter_by_transit(transit)
end

When("user choose flight schedule") do
	@browser = FlightSchedulePage.new

	@browser.button_pilih.first.click	
end

When("user fill flight buyer and passenger form") do
	@browser = FlightPassengerFormPage.new

	@browser.wait_until_count_down_pesanan_visible(wait:20)
	expect(@browser).to have_text('Detail Pemesan')
	expect(@browser).to have_text('Detail Penumpang')

	# Fill Buyer Info
	@browser.buyer_title_dropdown.click
	@browser.title_mr.click
	@browser.buyer_name_input.send_keys(ENV['BUYER_NAME'])
	@browser.buyer_email_input.send_keys(ENV['BUYER_EMAIL'])
	@browser.buyer_phone_input.send_keys(ENV['BUYER_PHONE'])

	# Fill Passenger Data
	@browser.passenger_title_dropdown.click
	@browser.title_mr.click
	@browser.passenger_name_input.send_keys(ENV['PASSENGER_NAME'])
	@browser.passenger_nationality_input.click
	@browser.indonesia_nationality.click

	@browser.button_continue.click
	expect(@browser).to have_text('Lanjutkan ke pembayaran?')
	@browser.button_yes_continue.click
end
