*** Settings ***
Documentation    Shopping Cart
Resource    ../common.resource

*** Variables ***
${link_shopping_cart}  xpath://a[@data-test="shopping-cart-link"]
${button_checkout}  id:checkout

*** Keywords ***
Check That Shopping Cart Can Be Opened
    Wait And Click   ${link_shopping_cart}
    Wait Until Element Is Enabled  ${button_checkout}