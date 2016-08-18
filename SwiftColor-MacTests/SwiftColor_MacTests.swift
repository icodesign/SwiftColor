//
//  SwiftColor_MacTests.swift
//  SwiftColor-MacTests
//
//  Created by LEI on 5/15/15.
//  Copyright (c) 2015 TouchingApp. All rights reserved.
//

import Cocoa
import XCTest
import SwiftColor

class SwiftColor_MacTests: XCTestCase {
    
    let color = NSColor(red: 77/255.0, green: 162/255.0, blue: 217/255.0, alpha: 0.8)
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHexStringInit() {
        // This is an example of a functional test case.
        XCTAssert(color == Color(hexString: "4DA2D9CC"), "Pass")
        XCTAssert(color == Color(hexString: "#4DA2D9CC"), "Pass")
        XCTAssert(color == Color(hexString: "0x4DA2D9CC"), "Pass")
        
        XCTAssert(color == Color(hexString: "0x4DA2D9", alpha: 0.8), "Pass")
    }
    
    func testHexIntInit() {
        // This is an example of a functional test case.
        XCTAssert(color == Color(hexInt: 0x4DA2D9CC), "Pass")
        
        XCTAssert(color == Color(hexInt: 0x4DA2D9, alpha: 0.8), "Pass")
    }
    
    func testStringShort() {
        // This is an example of a functional test case.
        XCTAssert(color == "0x4DA2D9CC".color, "Pass")
        
    }
    
    func testIntShort() {
        // This is an example of a functional test case.
        XCTAssert(color == (0x4DA2D9CC).color, "Pass")

    }

    
}
