//
//  BaseColor.swift
//
//
//  Created by Zhalgas on 09.02.2023.
//

import SwiftUI

public struct BaseColor: Equatable {

    public let red: CGFloat
    public let green: CGFloat
    public let blue: CGFloat
    public let alpha: CGFloat

    public var color: Color { Color(red: red, green: green, blue: blue, opacity: alpha) }
    public var uiColor: UIColor { UIColor(red: red, green: green, blue: blue, alpha: alpha) }
    public var cgColor: CGColor { CGColor(red: red, green: green, blue: blue, alpha: alpha) }

    public init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }

    public init(hex: String = #function) {
        if let rgb = Self.convert(hex: hex) {
            (red, green, blue, alpha) = (rgb.red, rgb.green, rgb.blue, rgb.alpha)
        } else {
            (red, green, blue, alpha) = (0, 0, 0, 1)
        }
    }

    private static func convert(hex: String) -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)? {
        let hexColor = hex.filter { $0.isHexDigit }
        guard hexColor.count == 6 || hexColor.count == 8 else { return nil }

        let scanner = Scanner(string: hexColor)
        var hexNumber = UInt64.zero
        guard scanner.scanHexInt64(&hexNumber) else { return nil }

        if hexColor.count == 6 {
            let red = CGFloat((hexNumber & 0xff0000) >> 16) / 255
            let green = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
            let blue = CGFloat((hexNumber & 0x0000ff)) / 255
            return (red, green, blue, 1)
        } else {
            let red = CGFloat((hexNumber & 0xff000000) >> 24) / 255
            let green = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
            let blue = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
            let alpha = CGFloat((hexNumber & 0x000000ff)) / 255
            return (red, green, blue, alpha)
        }
    }
}
