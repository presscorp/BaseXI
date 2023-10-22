//
//  BaseImage.swift
//  
//
//  Created by Zhalgas Baibatyr on 07.09.2023.
//

import UIKit

public struct BaseImage: Equatable {

    public let name: String

    public let bundle: Bundle

    public init(name: String = #function, bundle: Bundle = .main) {
        self.name = name
        self.bundle = bundle
    }

    public var uiImage: UIImage { UIImage(named: name, in: bundle, compatibleWith: nil) ?? UIImage() }

    public var uiImageTemplate: UIImage { uiImage.withRenderingMode(.alwaysTemplate) }

    public func uiImage(tint: UIColor) -> UIImage { uiImage.withTintColor(tint) }

    public func uiImageTemplate(tint: UIColor) -> UIImage { uiImageTemplate.withTintColor(tint) }

    public var cgImage: CGImage? { uiImage.cgImage }
}
