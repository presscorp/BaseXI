//
//  BaseView.swift
//
//
//  Created by Zhalgas Baibatyr on 01.08.2023.
//

import UIKit

open class BaseView: UIView {

    open var isDarkMode: Bool { traitCollection.userInterfaceStyle == .dark }

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

    override open func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if let customView = self as? ViewCustomizable {
            customView.restyleViews()
        }
    }
}
