//
//  BaseColor.swift
//
//
//  Created by Zhalgas on 09.02.2023.
//

import SwiftUI

public struct BaseColor: Equatable {
    
    public let hexCode: String
    
    public var color: Color { Color(hex: hexCode) ?? .black }

    public var uiColor: UIColor { UIColor(hex: hexCode) ?? .black }

    public var cgColor: CGColor { uiColor.cgColor }
    
    public init(hexCode: String = #function) {
        self.hexCode = hexCode.filter { $0.isHexDigit } .uppercased()
    }
}
