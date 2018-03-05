//
//  CloudconnectivTaskTests.swift
//  CloudconnectivTaskTests
//
//  Created by mac on 3/4/18.
//  Copyright © 2018 OrderEra. All rights reserved.
//

import XCTest
@testable import CloudconnectivTask

class ApiClientTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testApiClient_whenRequestHomeItems_thenExpectSuccess() {
        func testApiClient_whenRequestHomeItems_thenExpectSuccess() {
            let expectation = self.expectation(description: "Get Home Items")
            APIClient.callGetService(type: .machine, attrebute: "page=0", callback: {response , error in
                XCTAssertNil(error);
                XCTAssertNotNil(response)
                expectation.fulfill()
            })
            
            self.waitForExpectations(timeout: 30, handler: { error in
                XCTAssertNil(error)
            })
        }
    }
}

