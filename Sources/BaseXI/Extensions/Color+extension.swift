//
//  Color+extension.swift
//  
//
//  Created by Zhalgas on 09.02.2023.
//

import SwiftUI

public extension Color {

    init?(hex: String) {
        let hexColor = hex.filter { $0.isHexDigit }
        guard hexColor.count == 6 else { return nil }

        let scanner = Scanner(string: hexColor)
        var hexNumber = UInt64.zero
        guard scanner.scanHexInt64(&hexNumber) else { return nil }

        let r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
        let g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
        let b = CGFloat((hexNumber & 0x0000ff)) / 255

        self.init(red: r, green: g, blue: b)
    }
}

