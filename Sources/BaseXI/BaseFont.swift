//
//  BaseFont.swift
//  
//
//  Created by Zhalgas on 09.02.2023.
//

import SwiftUI
import UIKit

public struct BaseFont {

    public let name: String
    
    public let ext: String
        
    public let bundle: Bundle

    public init(name: String, ext: String, bundle: Bundle = .main) {
        self.name = name
        self.ext = ext
        self.bundle = bundle
    }
    
    public func font(ofSize size: CGFloat) -> Font {
        if let uiFont = UIFont(name: name, size: size) {
            return Font(uiFont as CTFont)
        }

        var error: Unmanaged<CFError>?

        // Register font
        guard let url = bundle.url(forResource: name, withExtension: ext),
              CTFontManagerRegisterFontsForURL(url as CFURL, .process, &error),
              let uiFont = UIFont(name: name, size: size) else {
            dump(error)
            return .system(size: size)
        }

        return Font(uiFont as CTFont)
    }

    public func uiFont(ofSize size: CGFloat) -> UIFont {
        if let font = UIFont(name: name, size: size) {
            return font
        }

        var error: Unmanaged<CFError>?

        // Register font
        guard let url = bundle.url(forResource: name, withExtension: ext),
              CTFontManagerRegisterFontsForURL(url as CFURL, .process, &error) else {
            dump(error)
            return .systemFont(ofSize: size)
        }

        return UIFont(name: name, size: size) ?? .systemFont(ofSize: size)
    }
}
