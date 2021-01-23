//
//  UIColorExtensions.swift
//  SwiftColors
//
//  Created by icodesign on 3/26/15.
//  Copyright (c) 2015 Potatso Lab. All rights reserved.
//

#if os(macOS)
    import Cocoa
    public typealias NativeColor = NSColor
    public typealias Image = NSImage
#else
    import UIKit
    public typealias NativeColor = UIColor
    public typealias Image = UIImage
#endif

extension NativeColor {
    
    public convenience init(_ hexString: String) {
        self.init(hexString: hexString, alpha: 1.0)
    }
    
    public convenience init(hexInt: Int, alpha: Float = 1.0) {
        let hexString = String(format: "%06X", hexInt)
        self.init(hexString: hexString, alpha: alpha)
    }
    
    public convenience init(hexString: String, alpha: Float = 1.0) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var mAlpha: CGFloat = CGFloat(alpha)
        var minusLength = 0
        
        let scanner = Scanner(string: hexString)
        
        if hexString.hasPrefix("#") {
            scanner.currentIndex = scanner.string.index(scanner.string.startIndex, offsetBy: "#".count)
            minusLength = 1
        }
        if hexString.hasPrefix("0x") {
            scanner.currentIndex = scanner.string.index(scanner.string.startIndex, offsetBy: "0x".count)
            minusLength = 2
        }
        var hexValue: UInt64 = 0
        scanner.scanHexInt64(&hexValue)
        switch hexString.count - minusLength {
        case 3:
            red = CGFloat((hexValue & 0xF00) >> 8) / 15.0
            green = CGFloat((hexValue & 0x0F0) >> 4) / 15.0
            blue = CGFloat(hexValue & 0x00F) / 15.0
        case 4:
            red = CGFloat((hexValue & 0xF000) >> 12) / 15.0
            green = CGFloat((hexValue & 0x0F00) >> 8) / 15.0
            blue = CGFloat((hexValue & 0x00F0) >> 4) / 15.0
            mAlpha = CGFloat(hexValue & 0x000F) / 15.0
        case 6:
            red = CGFloat((hexValue & 0xFF0000) >> 16) / 255.0
            green = CGFloat((hexValue & 0x00FF00) >> 8) / 255.0
            blue = CGFloat(hexValue & 0x0000FF) / 255.0
        case 8:
            red = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
            green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
            blue = CGFloat((hexValue & 0x0000FF00) >> 8) / 255.0
            mAlpha = CGFloat(hexValue & 0x000000FF) / 255.0
        default:
            break
        }
        self.init(red: red, green: green, blue: blue, alpha: mAlpha)
    }
    
    /// color components value between 0 to 255
    public convenience init(byteRed red: Int, green: Int, blue: Int, alpha: Float = 1.0) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(alpha))
    }
    
    public func alpha(_ value: Float) -> NativeColor {
        let (red, green, blue, _) = colorComponents()
        return NativeColor(red: red, green: green, blue: blue, alpha: CGFloat(value))
    }
    
    public func red(_ value: Int) -> NativeColor {
        let (_, green, blue, alpha) = colorComponents()
        return NativeColor(red: CGFloat(value)/255.0, green: green, blue: blue, alpha: alpha)
    }
    
    public func green(_ value: Int) -> NativeColor {
        let (red, _, blue, alpha) = colorComponents()
        return NativeColor(red: red, green: CGFloat(value)/255.0, blue: blue, alpha: alpha)
    }
    
    public func blue(_ value: Int) -> NativeColor {
        let (red, green, _, alpha) = colorComponents()
        return NativeColor(red: red, green: green, blue: CGFloat(value)/255.0, alpha: alpha)
    }
    
    public func colorComponents() -> (CGFloat, CGFloat, CGFloat, CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        #if os(macOS)
            self.usingColorSpace(.genericRGB)!.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        #else
            self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        #endif
        return (red, green, blue, alpha)
    }
    
}

extension String {
    
    public var color: NativeColor {
        return NativeColor(hexString: self)
    }
    
}

extension Int {
    
    public var color: NativeColor {
        return NativeColor(hexInt: self)
    }
    
}

extension NativeColor {
    
    public func toImage(size: CGSize = CGSize(width: 1, height: 1)) -> Image? {
        #if os(macOS)
            let image = NSImage(size: size)
            image.lockFocus()
            drawSwatch(in: NSMakeRect(0, 0, size.width, size.height))
            image.unlockFocus()
            return image
        #else
            let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            UIGraphicsBeginImageContextWithOptions(size, false, 0)
            self.setFill()
            UIRectFill(rect)
            let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image
        #endif
    }
    
}


#if canImport(SwiftUI)
import SwiftUI

extension Color {

    public init(_ hexString: String) {
        self.init(NativeColor(hexString))
    }

    public init(hexInt: Int, alpha: Float = 1.0) {
        self.init(NativeColor(hexInt: hexInt, alpha: alpha))
    }

    public init(hexString: String, alpha: Float = 1.0) {
        self.init(NativeColor(hexString: hexString, alpha: alpha))
    }
}

#endif
