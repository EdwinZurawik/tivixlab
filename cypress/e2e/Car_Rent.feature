Feature: Tivixlabs - Car rent

    Background:
        Given I navigate to the tivixlabs homepage
        When I select a country 'Poland'
        And I select a city 'Cracow'
        And I enter a model name 'suzuki'
        And I enter a pick up date '2100-10-20'
        And I enter a drop off date '2100-10-22'
        And I click on the search button
        And I click on the rent button of the selected car 3
        And I click on the rent button

    Scenario: Correct completion of the car rent form

        And I enter a first name 'Janusz'
        And I enter a last name 'Testowe'
        And I enter a card number '4916158542498077'
        And I enter an email 'test@gmail.com'
        And I submit the rent form
        
        Then I should be presented with a message 'Success'
    

    Scenario Outline: Incorrect completion of the car rent form - invalid data provided

        And I enter a first name '<firstName>'
        And I enter a last name '<lastName>'
        And I enter a card number '<cardNumber>'
        And I enter an email '<email>'
        And I submit the rent form
        
        Then I should be presented with an error '<error>'

        Examples:
        |firstName                                          |lastName                                           |cardNumber                |email         |error|
        |1xRKccnqdtzqpVdb3nGbhn76gQlemuwh0YcLld24kE4ysobg7Bm|Testowe                                            |4916158542498077          |test@gmail.com|Name value is too long|
        |1xRKccnqdtzqpVdb3nGbhn76gQlemuwh0YcLld24kE4ysobg7B |Testowe                                            |4916158542498077          |test@gmail.com|Name value is too long|
        |Janusz                                             |1xRKccnqdtzqpVdb3nGbhn76gQlemuwh0YcLld24kE4ysobg7Bm|4916158542498077          |test@gmail.com|Last name value is too long|
        |Janusz                                             |1xRKccnqdtzqpVdb3nGbhn76gQlemuwh0YcLld24kE4ysobg7B |4916158542498077          |test@gmail.com|Last name value is too long|
        |Janusz                                             |Testowe                                            |Test|test@gmail.com       |Card number contains wrong chars|
        |Janusz                                             |Testowe                                            |81384224937256281683176663|test@gmail.com|Card number value is too long|
        |Janusz                                             |Testowe                                            |8138422493725628168317666 |test@gmail.com|Card number value is too long|
        |Janusz                                             |Testowe                                            |4916158542498077 |test|Please provide valid email|
        |Janusz                                             |Testowe                                            |4916158542498077 |@|Please provide valid email|
        |Janusz                                             |Testowe                                            |4916158542498077 |@xRKccnqdtzqpVdb3nGbhn76gQlemuwh0YcLld24kE4ysobg7Bm|Email value is too long|
        |Janusz                                             |Testowe                                            |4916158542498077 |@xRKccnqdtzqpVdb3nGbhn76gQlemuwh0YcLld24kE4ysobg7B|Email value is too long|

    