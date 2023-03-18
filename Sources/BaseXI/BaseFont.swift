//
//  BaseFont.swift
//  
//
//  Created by Zhalgas on 09.02.2023.
//

import SwiftUI
import UIKit

public struct BaseFont {

    public let title: String
    
    public let fileExtension: String
        
    public var bundle: Bundle { .main }
    
    public func font(ofSize size: CGFloat) -> Font? {
        guard let uiFont = uiFont(ofSize: size) else { return nil }
        return Font(uiFont as CTFont)
    }

    private func uiFont(ofSize size: CGFloat) -> UIFont? {
        if let font = UIFont(name: title, size: size) {
            return font
        }

        var error: Unmanaged<CFError>?

        // Register font
        guard let url = bundle.url(forResource: title, withExtension: fileExtension),
              CTFontManagerRegisterFontsForURL(url as CFURL, .process, &error) else {
            dump(error)
            return nil
        }

        return UIFont(name: title, size: size)
    }
}
