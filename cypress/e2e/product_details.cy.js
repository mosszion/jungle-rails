describe('Product Details', () => {
  it('should visit the Products page', () => {
    cy.visit('http://localhost:3000/products/index');

    // click on a product link to check if it is working
    cy.get('article').first().click(); 

    // verify the product detai page loads
    cy.url().should('include', '/products/'); 
  
});

});
