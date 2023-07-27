//
//  BaseTypable.swift
//  
//
//  Created by Zhalgas on 10.02.2023.
//

import SwiftUI

@available(iOS 14.0, *)
public protocol BaseTypable {

    var redactionReasons: RedactionReasons { get }
}

@available(iOS 14.0, *)
public extension BaseTypable {

    func font(_ type: BaseFont, ofSize size: CGFloat) -> Font {
        guard redactionReasons.isEmpty,
              let font = type.font(ofSize: size) else {
            return .system(size: size)
        }

        return font
    }
}

