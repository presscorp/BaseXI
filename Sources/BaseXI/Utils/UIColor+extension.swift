//
//  UIColor+extension.swift
//  
//
//  Created by Zhalgas Baibatyr on 15.06.2023.
//

import UIKit

public extension UIColor {

    convenience init?(hex: String) {
        let hexColor = hex.filter { $0.isHexDigit }
        guard hexColor.count == 6 else { return nil }

        let scanner = Scanner(string: hexColor)
        var hexNumber = UInt64.zero
        guard scanner.scanHexInt64(&hexNumber) else { return nil }

        let r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
        let g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
        let b = CGFloat((hexNumber & 0x0000ff)) / 255

        self.init(red: r, green: g, blue: b, alpha: 1)
    }
}
