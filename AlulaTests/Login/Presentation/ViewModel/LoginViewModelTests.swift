//
//  LoginViewModelTests.swift
//  AlulaTests
//
//  Created by mohamed sliem on 08/05/2024.
//

import XCTest
@testable import Alula

final class LoginViewModelTests: XCTestCase {

    var viewModel: LoginViewModel!
    var coordinator: LoginCoordinatorProtocol!
    var usecase: LoginUsecaseProtocol!
    var networkStub: LoginNetworkServiceStub?
    var repository: LoginRepositoryProtocol!
    
    override func setUp() {
        repository = LoginRepository()
        usecase = LoginUsecase(repository: repository)
        coordinator = LoginCoordinatorStub()
        networkStub = LoginNetworkServiceStub()
        
        viewModel = LoginViewModel(
            coordinator: coordinator,
            usecase: usecase
        )
    }
    
    override func tearDown() {
        coordinator = nil
        usecase = nil
        networkStub = nil
    }
    
    func testSuccessViewModelLoginCall() async {
        let token = Token(
            accessToken: "dlfkajdfklj;akldjfka;jf3o23o4",
            refreshToken: "owerofkoqrfjopqjeo1231021e3"
        )
        
        networkStub?.loginSuccessRequestStub()
        
        await viewModel.login()
        let expectedResult = viewModel.getCurrentToken()
        
        XCTAssertNotNil(expectedResult)
        XCTAssertEqual(expectedResult?.accessToken, token.accessToken)
        XCTAssertEqual(expectedResult?.refreshToken, token.refreshToken)
        
    }
    
    func testFailedViewModelLoginCall() async {
        
        networkStub?.loginFailedRequestStub()
        await viewModel.login()
        
        let expectedResult = viewModel.getCurrentToken()

        XCTAssertNil(expectedResult)

    }
    
    func testCoordinatorCallForHomeScene() {
        let coordinator = (coordinator as? Coordinator) // force casting to access NavigationController reference
        let exception = self.expectation(description: "Problem with view model call")
        Task{
            networkStub?.loginSuccessRequestStub()
            await viewModel.login()
            exception.fulfill()
        }
        
        wait(for: [exception], timeout: 5)

        // test coordinator.home() call inside viewModel.login method
        XCTAssert(coordinator?.navigationController.topViewController is HomeViewController)
    }
    
    func testCoordinatorCallForSignupScene(){
        let coordinator = (coordinator as? Coordinator) // force casting to access NavigationController reference

        //Test Coordinator.signup() call inside viewModel.newUserPressed()
        viewModel.newUserPressed()
        
        XCTAssert(coordinator?.navigationController.topViewController is SignupViewController)
        
    }
}
