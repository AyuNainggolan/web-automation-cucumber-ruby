@web-automation @train-transaction
Feature: Create Train Transaction on tiket.com website

  @train-transaction-oneway
  Scenario: Create one way train transaction with 1 adult and 1 infant and  choose seating
    Given user is on Kereta Api page
    And user search train "oneway" schedule with passenger
      | adult  | infant   |
      | 1      | 1        |
    Then list of "departure" train schedule should be displayed
    And user choose train schedule
    And user fill train buyer and passenger form
    And user choose seating
    When user choose "Virtual Account" payment method to continue the transaction
    Then transaction is succeed
