//
//  BaseColor.swift
//  BaseXI
//
//  Created by Zhalgas on 09.02.2023.
//

import SwiftUI

public struct BaseColor: RawRepresentable, Equatable {
    
    public let rawValue: String
    
    public var color: Color { Color(hex: rawValue) ?? .black }
    
    public init(rawValue: String = #function) {
        self.rawValue = rawValue.filter { $0.isHexDigit }.uppercased()
    }
}
