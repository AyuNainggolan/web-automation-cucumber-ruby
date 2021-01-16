@web-automation @flight-transaction
Feature: Create Flight Transaction on tiket.com website

  @flight-transaction-domestic-round-trip
  Scenario: Create domestic round trip schedule transaction with 1 transit using virtual account payment
    Given user access homepage tiket.com
    When user login with valid credential
    Then home page will have displayed
    When user choose "Tiket Pesawat" product
    And user search flight "domestic" "round trip" schedule
    Then list of "departure" flight schedule should be displayed
    And user filter the schedule with "1" transit
    And user choose flight schedule
    Then list of "return" flight schedule should be displayed
    And user filter the schedule with "1" transit
    And user choose flight schedule
    And user fill flight buyer and passenger form
    When user choose "Virtual Account" payment method to continue the transaction
    Then transaction is succeed
