//
//  BaseFont.swift
//  
//
//  Created by Zhalgas on 09.02.2023.
//

import SwiftUI
import UIKit

public class BaseFont: RawRepresentable, Equatable {

    public typealias RawValue = String

    public let rawValue: RawValue
    
    public let `extension`: String
    
    public var title: String { rawValue }
        
    public var bundle: Bundle { .main }
    
    public required init?(rawValue: String) { fatalError("Not implemented") }

    required public init(title: String, extension: String) {
        self.rawValue = title
        self.extension = `extension`
    }
    
    public func font(ofSize size: CGFloat) -> Font? {
        guard let uiFont = uiFont(ofSize: size) else { return nil }
        return Font(uiFont as CTFont)
    }
}

extension BaseFont {

    func uiFont(ofSize size: CGFloat) -> UIFont? {
        if let font = UIFont(name: title, size: size) {
            return font
        }

        var error: Unmanaged<CFError>?

        // Register font
        guard let url = bundle.url(forResource: title, withExtension: `extension`),
              CTFontManagerRegisterFontsForURL(url as CFURL, .process, &error) else {
            dump(error)
            return nil
        }

        return UIFont(name: title, size: size)
    }
}

