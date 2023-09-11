//
//  BaseButton.swift
//
//
//  Created by Zhalgas Baibatyr on 06.09.2023.
//

import UIKit

open class BaseButton: UIButton {

    public var isDarkMode: Bool { traitCollection.userInterfaceStyle == .dark }

    override public init(frame: CGRect) {
        super.init(frame: frame)

        if let customView = self as? ViewCustomizable {
            customView.customize()
        }
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        if let customView = self as? ViewCustomizable {
            customView.destruct()
        }
    }

    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if let customView = self as? ViewCustomizable {
            customView.restyleViews()
        }
    }
}
