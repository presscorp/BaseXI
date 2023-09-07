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
        guard redactionReasons.isEmpty else {
            return .system(size: size)
        }

        return type.font(ofSize: size)
    }
}

