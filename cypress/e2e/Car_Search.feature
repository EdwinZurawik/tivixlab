Feature: Tivixlabs - Car search

    Background:
        Given I navigate to the tivixlabs homepage

    Scenario: Correct completion of the car search form
        When I select a country 'Poland'
        And I select a city 'Cracow'
        And I enter a model name 'suzuki'
        And I enter a pick up date '2100-10-20'
        And I enter a drop off date '2100-10-22'
        And I click on the search button

        Then I should be presented with a list of available cars
    
    Scenario Outline: Incorrect completion of the car search form - invalid form data
        When I select a country '<country>'
        And I select a city '<city>'
        And I enter a model name '<model>'
        And I enter a pick up date '<pickupDate>'
        And I enter a drop off date '<dropoffDate>'
        And I click on the search button

        Then I should be presented with an error '<error>'

        Examples:
        | country|city  |model             |pickupDate|dropoffDate|error                     |
        | Poland |Cracow|suzuki            |2100-10-20|2100-10-19 |Please enter a valid date!|
        | Poland |Paris |suzuki            |2100-10-20|2100-10-22 |Country doesn\'t match city|
        | Poland |Cracow|Not existing model|2100-10-20|2100-10-22 |Empty cars list           |
        | Poland |Cracow|suzuki            |1999-10-20|1999-10-21 |Please enter a valid date!|
        | Poland |Cracow|suzuki            |1999-10-20|2030-10-21 |Please enter a valid date!|

    Scenario Outline: Correct completion of the car search form - rent calculation
        When I select a country 'Poland'
        And I select a city 'Cracow'
        And I enter a model name 'suzuki'
        And I enter a pick up date '<pickupDate>'
        And I enter a drop off date '<dropoffDate>'
        And I click on the search button

        Then I should be presented with correctly calculated rent prices '<dropoffDate>' - '<pickupDate>'

        Examples:
        |pickupDate|dropoffDate|
        |2100-10-20|2100-10-20 |
        |2100-10-20|2100-10-21 |
        |2100-12-20|2101-01-10 |