import { When, Then } from "@badeball/cypress-cucumber-preprocessor";

When('I click', () => {
    cy.get('a.btn.btn-primary').click();
});

When('I enter a first name {string}', (firstName) => {
    cy.get('#name').type(firstName);
});

When('I enter a last name {string}', (lastName) => {
    cy.get('#last_name').type(lastName);
});

When('I enter a card number {string}', (cardNumber) => {
    cy.get('#card_number').type(cardNumber);
});

When('I enter an email {string}', (email) => {
    cy.get('#email').type(email);
});

When('I submit the rent form', () => {
    cy.get('button.btn.btn-primary').click();
});

Then('I should be presented with a message {string}', (message) => {
    cy.contains(message);
})