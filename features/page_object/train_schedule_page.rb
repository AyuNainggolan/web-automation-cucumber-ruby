# frozen_string_literal: true

class TrainSchedulePage < SitePrism::Page
  element :coach_mark_box, :xpath, "//div[contains(@class, 'ab-in-app-message')]"
  element :button_mengerti, :xpath, "//button[text()='Ok, mengerti']"
  element :schedule_card, '.search-result'

  element :filter_one_transit, :xpath, "//input[@id='stop']/parent::div/parent::div"
  element :filter_two_transit, :xpath, "//input[@id='stops']/parent::div/parent::div"
  element :filter_direct, :xpath, "//input[@id='direct']/parent::div/parent::div"
  elements :button_pilih, :xpath, "//button[text()='Pilih']"
  
  def skip_coachmark
  	button_mengerti.click if has_coach_mark_box?
  end

  
end
