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
        
    public var bundle: Bundle { .main }

    public init(name: String, ext: String) {
        self.name = name
        self.ext = ext
    }
    
    public func font(ofSize size: CGFloat) -> Font? {
        guard let uiFont = uiFont(ofSize: size) else { return nil }
        return Font(uiFont as CTFont)
    }

    public func uiFont(ofSize size: CGFloat) -> UIFont? {
        if let font = UIFont(name: name, size: size) {
            return font
        }

        var error: Unmanaged<CFError>?

        // Register font
        guard let url = bundle.url(forResource: name, withExtension: ext),
              CTFontManagerRegisterFontsForURL(url as CFURL, .process, &error) else {
            dump(error)
            return nil
        }

        return UIFont(name: name, size: size)
    }
}
