//
//  Fakestagram_Xcode10Tests.swift
//  Fakestagram-Xcode10Tests
//
//  Created by Ricardo Hernández González on 9/27/19.
//  Copyright © 2019 unam. All rights reserved.
//

import XCTest
@testable import Fakestagram_Xcode10

class RequestBuilderTest: XCTestCase {
    
    func testBuilderURL(){
        var builder = RequestBuilder(baseUrl: "https://fakestagram-api.herokuapp.com")
        builder.path = "/api/v1/accounts"
        XCTAssertEqual(builder.scheme, "https")
        XCTAssertEqual(builder.method,"get")
        XCTAssertEqual(builder.url(), URL(string: "https://fakestagram-api.herokuapp.com/api/v1/accounts")!)
        
    }
    
    func testBuildInvalidURL(){
        var builder = RequestBuilder(baseUrl: "example.com" )
        builder.path = "//@3èrw456-123432432"
        XCTAssertNil(builder.url())
    }

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testBuildForceSchemeURL(){
        var builder = RequestBuilder(baseUrl: "http://fakestagram-api.herokuapp.com/")
        XCTAssertEqual(builder.url(), URL(string: "https://fakestagram-api.herokuapp.com")!)
    }

    func testBuildRequest(){
        var builder = RequestBuilder(baseUrl: "example.com")
        builder.path = "//@3èr`w456-123432432"
        XCTAssertNil(builder.request())
    }
    
    func testBuildValidRequest(){
        var builder = RequestBuilder(baseUrl: "https://example.com/")
        builder.path = "/api/v1/accounts"
        builder.method = "post"
        builder.body = "{\"a\":1}".data(using: .utf8)!
        
        let result = builder.request()
        XCTAssertNotNil(result)
        XCTAssertEqual(result!.httpMethod, "POST")
        
    }

}
