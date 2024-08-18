describe('Home Page', () => {
  it('should visit the home page', () => {
    cy.visit('http://localhost:3000');
    
  });
  it("There is products on the page", () => {
    cy.visit("/products/index");
    cy.get(".products article").should("be.visible");
  });
  it("There is 2 products on the page", () => {
    cy.visit("/products/index");
    cy.get(".products article").should("have.length", 1);
  });
  
  
});