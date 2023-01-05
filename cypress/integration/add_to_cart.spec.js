describe("Add to cart button", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000");
  });

  it("should add an item to the cart and update the number of items in the cart", () => {
    cy.get(".products article").should("be.visible");

    cy.get(".products article").eq(0).find(".btn").click({ force: true });

    cy.get(".nav-item.end-0").should("not.have.value", "My Cart (0)");
  });
});