describe("Product Details", () => {
  beforeEach(()=> {
    cy.visit("http://localhost:3000");
  })

  it("navigates to a product's page once the product is clicked", () => {
    cy.get(".products article").should("be.visible").eq(0).click();

    cy.get(".product-detail").should("be.visible");
  })
});