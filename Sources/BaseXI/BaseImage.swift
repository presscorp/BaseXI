//
//  BaseImage.swift
//  
//
//  Created by Zhalgas Baibatyr on 07.09.2023.
//

import UIKit

public struct BaseImage: Equatable {

    public let name: String

    public var bundle: Bundle { .main }

    public init(name: String = #function) {
        self.name = name
    }

    public var uiImage: UIImage {
        return UIImage(named: name, in: bundle, compatibleWith: nil) ?? UIImage()
    }

    public var uiImageTemplate: UIImage { uiImage.withRenderingMode(.alwaysTemplate) }

    func uiImage(tint: UIColor) -> UIImage { uiImage.withTintColor(tint) }

    var cgImage: CGImage? { uiImage.cgImage }
}
