class PaymentPage < SitePrism::Page
	elements :payment_method_list, '.payment-methods-list'
	element :bca_virtual_account, :xpath, "//span[text()='BCA Virtual Account']/parent::div"
	element :atm, :xpath, "//span[text()='ATM']/parent::div"
	element :alfamart_gerai, :xpath, "//span[text()='Alfamart']/parent::div"
	element :price_summary, '.price-summary.card'
	element :button_continue, :xpath, "//button[text()='Lanjutkan']"
	element :order_info, '.order-info'
	element :button_see_order_list, :xpath, "//button[text()='Lihat Daftar Pesanan']"

	def choose_payment_method(payment_method)
		case payment_method
		when "Virtual Account"
		  bca_virtual_account.click
		when "Gerai"
		  alfamart_gerai.click
		when "ATM"
			atm.click
		else
		  puts "Check your choice"
		end
	end
end