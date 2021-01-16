# frozen_string_literal: true

class FlightSearchPage < SitePrism::Page
  element :input_oneway, :xpath, "//input[@id='oneWay']/parent::div"
  element :input_roundtrip, :xpath, "//input[@id='roundTrip']/parent::div"
  element :input_departure_field, '#productSearchFrom'
  element :input_destination_field, '#productSearchTo'
  element :airport_list, '.flight-search-airport-city-content'
  element :button_done, :xpath, "//span[text()='SELESAI']"
  element :button_search_schedule, '.product-form-search-btn'
  
  def choose_trip(trip_type)
  	if trip_type == 'round trip'
  		input_roundtrip.click
  	else
  		input_oneway.click
  	end
  end
  
  def choose_airport(category)
  	origin_code = ENV['ORIGIN_AIRPORT_CODE']
  	destination_code = category == 'domestic' ? ENV['DESTINATION_DOMESTIC_AIRPORT_CODE'] : ENV['DESTINATION_INTERNATIONAL_AIRPORT_CODE']

  	#search departure
  	input_departure_field.send_keys(origin_code)
    sleep 2
  	airport_list.click

  	#search destination
    sleep 2
  	input_destination_field.send_keys(destination_code)
    sleep 2
  	airport_list.click
  end

  def choose_trip_date(trip_type)
  	choose_spesific_date(2)

  	return unless trip_type == 'round trip'
  	choose_spesific_date(3)
  end

  def choose_spesific_date(next_date)
  	elm = "//span[@class='widget-date-picker-date-content']"

  	next_day = Date.today.to_s.split('-').last.to_i + next_date
    date_text = next_day > 30 ? 5 : next_day
    find(:xpath, elm, text: date_text, match: :first).click
  end
end
