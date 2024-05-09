//
//  LoginSceneUITests.swift
//  AlulaUITests
//
//  Created by mohamed sliem on 09/05/2024.
//

import XCTest


final class LoginSceneUITests: XCTestCase {

    
    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testValidLoginSuccess() {
        
        
        let validEmail = "mohamedsliem@gmail.com"
        let validPassword = "mohamed011"
        
        let app = XCUIApplication()
        
        let signupButton = app.staticTexts["Signup"]
        signupButton.tap()
    
        let alreadyMemberButton =  app/*@START_MENU_TOKEN@*/.staticTexts["Already Member?  Login"]/*[[".buttons[\"Already Member?  Login\"].staticTexts[\"Already Member?  Login\"]",".staticTexts[\"Already Member?  Login\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(alreadyMemberButton.exists)
        alreadyMemberButton.tap()
        
        let emailTextField = app.textFields["Email"]
        XCTAssertTrue(emailTextField.exists)
        emailTextField.tap()
        emailTextField.typeText(validEmail)
        
        
        let passwordTextField = app.textFields["Password"]
        XCTAssertTrue(passwordTextField.exists)
        passwordTextField.tap()
        passwordTextField.typeText(validPassword)

        app.buttons["Return"].tap()

        let loginButton = app/*@START_MENU_TOKEN@*/.staticTexts["Login"]/*[[".buttons[\"Login\"].staticTexts[\"Login\"]",".staticTexts[\"Login\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(loginButton.exists)
        loginButton.tap()
        
        expectation(for: NSPredicate(format: "exists == 0"), evaluatedWith: loginButton)
        waitForExpectations(timeout: 5)
    }
    
    func testInvalidLoginWithAlertShown() {
        
        let invalidEmail = "mohamedsliem.com"
        let invalidPassword = "m1"
        
        
        let app = XCUIApplication()
        
        let signupButton = app.staticTexts["Signup"]
        signupButton.tap()
    
        let alreadyMemberButton =  app/*@START_MENU_TOKEN@*/.staticTexts["Already Member?  Login"]/*[[".buttons[\"Already Member?  Login\"].staticTexts[\"Already Member?  Login\"]",".staticTexts[\"Already Member?  Login\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(alreadyMemberButton.exists)
        alreadyMemberButton.tap()       
        
        let emailTextField = app.textFields["Email"]
        XCTAssertTrue(emailTextField.exists)
        emailTextField.tap()
        emailTextField.typeText(invalidEmail)
        
        
        let passwordTextField = app.textFields["Password"]
        XCTAssertTrue(passwordTextField.exists)
        passwordTextField.tap()
        passwordTextField.typeText(invalidPassword)

        app.buttons["Return"].tap()
        
        app/*@START_MENU_TOKEN@*/.staticTexts["Login"]/*[[".buttons[\"Login\"].staticTexts[\"Login\"]",".staticTexts[\"Login\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let alertButton = app.alerts["Error"].scrollViews.otherElements.buttons["Ok"]
        
        XCTAssertTrue(alertButton.exists)
        alertButton.tap()
        
    }
}


