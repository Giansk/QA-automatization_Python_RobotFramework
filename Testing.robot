Import     SeleniumLibrary


*** Variables ***
${URL}  https://www.saucedemo.com/
${Browser}  Edge

*** Settings *** 
Library     SeleniumLibrary
Suite Setup  Open Browser    ${URL}   ${Browser}
Suite Teardown  Close Browser

*** Test Cases ***  
TEST Login
    Sleep   2 seconds
    Input Text    id=user-name    standard_user
    Sleep   2 seconds
    Input Text    id=password    secret_sauce
    Sleep   2 seconds
    Click Button    id=login-button
    Sleep   2 seconds

Test añadir productos
    Sleep   2 seconds
    Click Button    id=add-to-cart-sauce-labs-bike-light
    Sleep   2 seconds
    Click Button    id=add-to-cart-sauce-labs-bolt-t-shirt
    Sleep   2 seconds
    Click Button    id=add-to-cart-sauce-labs-fleece-jacket
    Sleep   2 seconds
    Click Button    id=add-to-cart-sauce-labs-onesie
    Sleep   2 seconds
    Click Button    id=add-to-cart-sauce-labs-backpack
    Sleep   2 seconds

Test ir al carrito
    Sleep   3 seconds
    Wait Until Page Contains Element    xpath=//*[@id="shopping_cart_container"]
    Sleep   2 seconds
    Click Element    xpath=//*[@id="shopping_cart_container"]
    Sleep   2 seconds
    Click Button    id=checkout


Test llenar datos de compra
    Sleep   2 seconds
    Input Text    id=first-name    Gian
    Sleep   2 seconds
    Input Text    id=last-name     Aguilar
    Sleep   2 seconds
    Input Text    id=postal-code   507
    Sleep   2 seconds
    Click Button    id=continue
    Sleep   5 seconds

Test revisar datos de compra
    Wait Until Page Contains Element    xpath=//*[@id="checkout_summary_container"]
    Sleep   10 seconds
    Element Text Should Be  class=summary_subtotal_label   Item total: $113.94999999999999
    Element Text Should Be  class=summary_tax_label   Tax: $9.12
    Element Text Should Be  class=summary_total_label   Total: $123.07
    Click Button    id=finish
    Sleep   5 seconds

Test revisar mensaje de compra
    Wait Until Page Contains Element    xpath=//*[@id="checkout_complete_container"]
    Sleep   5 seconds
    Element Text Should Be  class=complete-header   Thank you for your order!
    Element Text Should Be  class=complete-text   Your order has been dispatched, and will arrive just as fast as the pony can get there!
    Click Button    id=back-to-products
    Sleep   5 seconds

Test cerrar sesión
    Click Button    id=react-burger-menu-btn
    Sleep   2 seconds
    Click Element    id=logout_sidebar_link
    Sleep   2 seconds
    Element Text Should Be  class=login_logo   Swag Labs
    Sleep   2 seconds