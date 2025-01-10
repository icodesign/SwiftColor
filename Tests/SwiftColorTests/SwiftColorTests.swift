//
//  SwiftColorsTests.swift
//  SwiftColorsTests
//
//  Created by icodesign on 3/26/15.
//  Copyright (c) 2015 PotatsoLab. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit
import XCTest
import SwiftColor

private func ==(lhs: _NativeColor, rhs: _NativeColor) -> Bool {
    let (lRed, lGreen, lBlue, lAlpha) = lhs.colorComponents()
    let (rRed, rGreen, rBlue, rAlpha) = rhs.colorComponents()
    return fabsf(Float(lRed - rRed)) < .ulpOfOne
        && fabsf(Float(lGreen - rGreen)) < .ulpOfOne
        && fabsf(Float(lBlue - rBlue)) < .ulpOfOne
        && fabsf(Float(lAlpha - rAlpha)) < .ulpOfOne
}

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
        XCTAssert(UIColor.black == _NativeColor(hexString: "000000", alpha: 1.0), "Pass")
        XCTAssert(UIColor.black == _NativeColor(hexString: "#000000", alpha: 1.0), "Pass")
        XCTAssert(UIColor.black == _NativeColor(hexString: "0x000000", alpha: 1.0), "Pass")
        
        XCTAssert(color == _NativeColor(hexString: "#4DA2D9CC"), "Pass")
        XCTAssert(color == _NativeColor(hexString: "0x4DA2D9CC"), "Pass")
                
        XCTAssert(color == _NativeColor(hexString: "#4DA2D9", alpha: 0.8), "Pass")
        XCTAssert(UIColor.black == _NativeColor(hexString: "0x000", alpha: 1.0), "Pass")
        XCTAssert(UIColor.red.withAlphaComponent(0.5) == _NativeColor(hexString: "0xF00", alpha: 0.5), "Pass")
        XCTAssert(UIColor.red.withAlphaComponent(0.2) == _NativeColor(hexString: "0xF003"), "Pass")

        XCTAssert(UIColor(red: 0, green: 0, blue: 0, alpha: 1.0) == _NativeColor(hexString: "#AAAAAAA4DA2D9"), "Pass")
    }
    
    func testHexIntInit() {
        // This is an example of a functional test case.
        XCTAssert(UIColor.black == _NativeColor(hexInt: 0x000000), "Pass")

        XCTAssert(color == _NativeColor(hexInt: 0x4DA2D9, alpha: 0.8), "Pass")

        let color1 = UIColor(red: 0/255.0, green: 122/255.0, blue: 255/255.0, alpha: 1.0)
        XCTAssert(color1 == _NativeColor(hexInt: 0x007AFF), "Pass")
    }
    
    func testModifyFunc() {
        // This is an example of a functional test case.
        XCTAssert(_NativeColor(hexInt: 0x000).red(255) == _NativeColor.red, "Pass")
        XCTAssert(_NativeColor(hexInt: 0x000).green(255) == _NativeColor.green, "Pass")
        XCTAssert(_NativeColor(hexInt: 0x000).blue(255) == _NativeColor.blue, "Pass")
        XCTAssert(_NativeColor(hexInt: 0x4DA2D9).alpha(0.8) == color, "Pass")
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
        XCTAssert(_NativeColor(byteRed: 77, green: 162, blue: 217, alpha: 0.8) == color, "Pass")
    }
}

#endif
