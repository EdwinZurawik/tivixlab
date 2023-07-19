import { When } from "@badeball/cypress-cucumber-preprocessor";

When('I click on the rent button', () => {
    cy.get('a.btn.btn-primary').click();
});