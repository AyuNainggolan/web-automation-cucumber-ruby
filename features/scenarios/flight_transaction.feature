@web-automation @flight-transaction
Feature: Create Transaction on tiket.com website

  @flight-transaction-domestic-round-trip
  Scenario: Create domestic round trip schedule transaction with 1 transit using virtual account payment
    Given user access homepage tiket.com
    # When user login with valid credential
    # Then home page will have displayed
    When user choose Tiket Pesawat product
    And user search flight "domestic" "round trip" schedule
    # And user filter the schedule with "1" transit
    # And user choose "round trip" schedule
    # And user fill buyer and passenger form
    # And user proceed to checkout
    # When user choose "Virtual Account" payment method to continue the transaction
    # Then user will see the detail of transaction






