# frozen_string_literal: true

class FlightSchedulePage < SitePrism::Page
  element :coach_mark_box, '.comp-info-box'
  element :button_mengerti, :xpath, "//div[contains(@class, 'btn-action') and text()='Mengerti']"
  element :schedule_card, '.wrapper-flight-list'
  element :filter_one_transit, :xpath, "//input[@id='stop']/parent::div/parent::div"
  element :filter_two_transit, :xpath, "//input[@id='stops']/parent::div/parent::div"
  element :filter_direct, :xpath, "//input[@id='direct']/parent::div/parent::div"
  elements :button_pilih, :xpath, "//div[text()='PILIH']"
  
  def skip_coachmark
  	button_mengerti.click if has_coach_mark_box?
  end

  def filter_by_transit(filter)
  	case filter
		when "1"
		  filter_one_transit.click
		when "2"
		  filter_two_transit.click
		when "direct"
			filter_direct.click
		else
		  puts "Check your choice, should be 1 or 2 or direct"
		end
	end
end
