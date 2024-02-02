//
//  CitiesListViewModelTests.swift
//  SampleStateListAppTests
//
//  Created by Sunil Kumar on 02/02/24.
//

import XCTest

@testable import SampleStateListApp

final class CitiesListViewModelTests: XCTestCase {
    
    var viewModel: CitiesListViewModel!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = CitiesListViewModel()
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testLoadData() {
        viewModel.loadData()
        XCTAssertFalse(viewModel.items.isEmpty, "Items should not be empty after loading data")
    }
    func testGroupCitiesByStateName() {
        
        let cities = [CitiesList(city: "Sydney", country: "Melbourne", admin_name: "New South Wales"), CitiesList(city: "Adelaide", country: "Australia", admin_name: "New South Wales"),CitiesList(city: "Perth", country: "Australia", admin_name: "Western Australia") ]
        viewModel.items = cities
        viewModel.groupCitiesByStateName()
        XCTAssertEqual(viewModel.groupedCities.count, 2, "Excepted two states in grouped")
       // XCTAssertEqual(viewModel.groupedCities[0].stateName, "State1", "Incorrect state name in the first group")
        XCTAssertEqual(viewModel.groupedCities[1].stateName, "Western Australia", "correct state name in the second group")
    }
}
