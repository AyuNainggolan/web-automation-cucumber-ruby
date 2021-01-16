class TrainSeatingPage < SitePrism::Page
	element :wagon_layout, '.wagon-layout'
	elements :available_seat, :xpath, "//div[@class='seat-box']/div[not(contains(@class, 'not-available'))]"
	element :button_continue, :xpath, "//button[text()='Lanjutkan ke Pembayaran']"
	element :button_yes_continue, :xpath, "//button[text()='YA, LANJUTKAN']"
end
