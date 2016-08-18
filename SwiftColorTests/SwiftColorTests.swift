//
//  SwiftColorsTests.swift
//  SwiftColorsTests
//
//  Created by LEI on 3/26/15.
//  Copyright (c) 2015 TouchingApp. All rights reserved.
//

import UIKit
import XCTest
import SwiftColor

class SwiftColorsTests: XCTestCase {
    
    let color = UIColor(red: 77/255.0, green: 162/255.0, blue: 217/255.0, alpha: 0.8)

    
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
        XCTAssert(UIColor.black == Color(hexString: "000"), "Pass")
        XCTAssert(UIColor.black == Color(hexString: "#000"), "Pass")
        XCTAssert(UIColor.black == Color(hexString: "0x000"), "Pass")
        XCTAssert(UIColor.black == Color(hexString: "000000"), "Pass")
        XCTAssert(UIColor.black == Color(hexString: "#000000"), "Pass")
        XCTAssert(UIColor.black == Color(hexString: "0x000000"), "Pass")
        
        XCTAssert(color == Color(hexString: "4DA2D9CC"), "Pass")
        XCTAssert(color == Color(hexString: "#4DA2D9CC"), "Pass")
        XCTAssert(color == Color(hexString: "0x4DA2D9CC"), "Pass")
                
        XCTAssert(color == Color(hexString: "0x4DA2D9", alpha: 0.8), "Pass")
    }
    
    func testHexIntInit() {
        // This is an example of a functional test case.
        XCTAssert(UIColor.black == Color(hexInt: 0x000), "Pass")
        XCTAssert(UIColor.black == Color(hexInt: 0x000000), "Pass")
        
        XCTAssert(color == Color(hexInt: 0x4DA2D9CC), "Pass")
        
        XCTAssert(color == Color(hexInt: 0x4DA2D9, alpha: 0.8), "Pass")
    }
    
    func testModifyFunc() {
        // This is an example of a functional test case.
        XCTAssert(Color(hexInt: 0x000).red(255) == Color.red, "Pass")
        XCTAssert(Color(hexInt: 0x000).green(255) == Color.green, "Pass")
        XCTAssert(Color(hexInt: 0x000).blue(255) == Color.blue, "Pass")
        XCTAssert(Color(hexInt: 0x4DA2D9).alpha(0.8) == color, "Pass")
    }
    
    func testStringShort() {
        // This is an example of a functional test case.
        XCTAssert(UIColor.black == "0x000".color, "Pass")
        
        XCTAssert(color == "0x4DA2D9CC".color, "Pass")
    
    }
    
    func testIntShort() {
        // This is an example of a functional test case.
        XCTAssert(UIColor.black == (0x000).color, "Pass")
        
        XCTAssert(color == (0x4DA2D9CC).color, "Pass")
        
    }
    
    func testByteColor() {
        XCTAssert(Color(byteRed: 77, green: 162, blue: 217, alpha: 0.8) == color, "Pass")
    }
    
    
}
