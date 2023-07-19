import { Given, Then, When } from "@badeball/cypress-cucumber-preprocessor";


const url = 'http://qalab.pl.tivixlabs.com/';

Given('I navigate to the tivixlabs homepage', () => {
    cy.visit(url);
});

When('I select a country {string}', (country) => {
    cy.get('#country').select(country);
});

When('I select a city {string}', (city) => {
    cy.get('#city').select(city);
});

When('I enter a model name {string}', (model) => {
    cy.get('#model').type(model);
});

When('I enter a pick up date {string}', (date) => {
    cy.get('#pickup').type(date);
});

When('I enter a drop off date {string}', (date) => {
    cy.get('#dropoff').type(date);
});

When('I click on the search button', () => {
    cy.get('button[type=submit]').click();
});

When('I click on the rent button of the selected car {int}', (index) => {
    cy.get('.btn').eq(index).click();
})

Then('I should be presented with a list of available cars', () => {
    cy.get('#search-results tr').should('have.length.at.least', 1);
});

Then('I should be presented with an error {string}', (error) => {
    cy.contains(error);
})

Then('I should be presented with correctly calculated rent prices {string} - {string}', (pickup, dropoff) => {
    let totalDays = Math.ceil((new Date(pickup) - new Date(dropoff)) / (1000 * 3600 * 24)) + 1;

    cy.get('#search-results>tbody>tr>td').eq(4).then(($pricePerDay) => {
        const pricePerDay = parseInt($pricePerDay.text());
        cy.get('#search-results>tbody>tr>td').eq(3).then(($totalPrice) => {
            const totalPrice = parseInt($totalPrice.text());

            expect(totalPrice).to.eq(totalDays * pricePerDay);
        })
    })
})