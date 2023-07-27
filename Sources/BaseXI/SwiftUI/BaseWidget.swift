//
//  BaseWidget.swift
//
//
//  Created by Zhalgas on 10.02.2023.
//

import SwiftUI
import WidgetKit

@available(iOS 14.0, *)
public protocol BaseWidget: Widget {

    var kindName: String { get }

    var supportedFamilies: [WidgetFamily] { get }
}

@available(iOS 14.0, *)
public extension BaseWidget {

    var kindName: String { String(describing: Self.self) }

    var kind: String { kindName }
}
