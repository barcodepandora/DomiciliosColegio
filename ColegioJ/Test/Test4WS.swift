//
//  Test4WS.swift
//  ColegioJTests
//
//  Created by Juan Manuel Moreno on 4/3/18.
//  Copyright © 2018 uzupis. All rights reserved.
//

import XCTest
//import WSController

class Test4WS: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
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
    
    func testGetForest() {
        
        let wsController = WSController()
        let forest = wsController.getForest()
        var schools = NSMutableArray()
        
        if let s = forest["school_buses"] {
            if (s as AnyObject).count > 0 {
                schools = forest["school_buses"] as! NSMutableArray
                XCTAssertTrue( (schools.count == 4) )
            }
        } else {
            //            schools = NSMutableArray()
            XCTAssert( false )
        }
    }
}

