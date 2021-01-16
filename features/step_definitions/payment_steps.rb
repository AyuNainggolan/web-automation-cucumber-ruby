When(/^user choose "([^"]*)" payment method to continue the transaction$/) do |payment_method|
	@browser = PaymentPage.new

	@browser.wait_until_payment_method_list_visible(wait:60)
	expect(@browser).to have_text('Metode Pembayaran')
	@browser.choose_payment_method(payment_method)
	@browser.wait_until_price_summary_visible(wait:30)
	@browser.button_continue.click
end

Then("transaction is succeed") do
	@browser = PaymentPage.new

	expect(@browser).to have_order_info
	expect(@browser).to have_button_see_order_list
end