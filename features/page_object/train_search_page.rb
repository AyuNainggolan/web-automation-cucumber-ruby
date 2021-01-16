# frozen_string_literal: true

class TrainSearchPage < SitePrism::Page
  set_url(ENV['WEB_BASE_URL'] + 'kereta-api')

  element :train_search_form, '.train-form'
  element :departure_station_input, :xpath, "//div[contains(@class, 'part-depart')]//input[contains(@class, 'input-airport')]"
  element :destination_station_input, :xpath, "//div[contains(@class, 'part-return')]//input[contains(@class, 'input-airport')]"
  elements :station_city, '.station-city'
  element :return_checkbox, :xpath, "//div[contains(@class, 'part-to-date')]//input[@type='checkbox']"
  element :button_plus_adult, :xpath, "(//div[@class='passenger-list-box']//button/i[contains(@class, 'tix-plus')])[1]"
  element :button_plus_infant, :xpath, "(//div[@class='passenger-list-box']//button/i[contains(@class, 'tix-plus')])[2]"
  element :current_adult_text, :xpath, "(//div[@class='passenger-list-box']//div[contains(@class, 'part counter')])[1]"
  element :current_infant_text, :xpath, "(//div[@class='passenger-list-box']//div[contains(@class, 'part counter')])[2]"
  element :button_done, :xpath, "//button[text()='Selesai']"
  element :button_search_schedule, :xpath, "//button[text()='Cari Kereta Api']"
  element :coach_mark_box, '.coach-mark'
  element :button_ok, :xpath, "//button[text()='OK']"
  
  def skip_coachmark
    sleep 3

    button_ok.click if has_coach_mark_box?
  end

  def choose_station
  	#search departure
  	departure_station_input.send_keys(ENV['ORIGIN_STATION_CODE'])
    sleep 2
  	station_city.first.click

  	#search destination
  	destination_station_input.send_keys(ENV['DESTINATION_STATION_CODE'])
    sleep 2
  	station_city.first.click
  end

  def choose_trip_date(trip_type)
  	choose_spesific_date(2)

  	return unless trip_type == 'round trip'
    return_checkbox.click
  	choose_spesific_date(3)
  end

  def choose_spesific_date(next_date)
    elm = "//div[@class='widget-date-picker-day']"
  	next_day = Date.today.to_s.split('-').last.to_i + next_date
    date_text = next_day > 30 ? 5 : next_day

    find(:xpath, elm, text: date_text, match: :first).click
  end

  def choose_passenger(data)
    passenger_data = data[0]
    number_of_adult = passenger_data['adult'].to_i
    number_of_infant = passenger_data['infant'].to_i
    current_adult = current_adult_text.text.to_i
    current_infant = current_infant_text.text.to_i

    while number_of_adult > current_adult do
      button_plus_adult.click
      current_adult +=1
    end

    while number_of_infant > current_infant do
      button_plus_infant.click
      current_infant +=1
    end
  end
end
