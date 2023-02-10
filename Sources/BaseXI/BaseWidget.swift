//
//  BaseWidget.swift
//
//
//  Created by Zhalgas on 10.02.2023.
//

import SwiftUI

@available(iOS 14.0, *)
public protocol BaseWidget: Widget {

    var kindName: String { get }
}

@available(iOS 14.0, *)
public extension BaseWidget {

    var kindName: String { String(describing: Self.self) }

    var kind: String { kindName }
}
