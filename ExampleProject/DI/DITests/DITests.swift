//
//  DITests.swift
//  DITests
//
//  Created by WANKI KIM on 2021/08/26.
//

import XCTest
@testable import DI

class DITests: XCTestCase {
    func test_is_ModelType_can_decode_JSONData() {
        let jokesAPI = JokesAPI()
        let data = jokesAPI.sampleData
        let decoder = JSONDecoder()
        
        guard let parsedData = try? decoder.decode(JokeResponse.self, from: data) else {
            XCTFail()
            return
        }
        XCTAssertEqual(parsedData.type, "success")
    }
    
    func test_URLSession_with_Network() {
        let expectation = XCTestExpectation(description: "wait for networking")
        var valueCheck: JokeResponse?
        let session = URLSession.shared
        let jokesAPIProvider = JokesAPIProvider(session: session)
        
        jokesAPIProvider.fetchRandomJoke { result in
            switch result {
            case .failure:
                XCTFail()
                return
            case .success(let data):
                valueCheck = data
                
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
        XCTAssertEqual(valueCheck?.type, "success")
    }
    
    func test_URLSession_without_Network() {
        let expectation = XCTestExpectation(description: "wait for networking")
        var valueCheck: JokeResponse?
        let session = MockURLSession()
        let jokesAPIProvider = JokesAPIProvider(session: session)
        
        jokesAPIProvider.fetchRandomJoke { result in
            switch result {
            case .failure:
                XCTFail()
                return
            case .success(let data):
                valueCheck = data
                
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
        XCTAssertEqual(valueCheck?.type, "success")
    }
}
