//
//  BaseInputView.swift
//
//
//  Created by Zhalgas Baibatyr on 13.08.2023.
//

import UIKit

open class BaseInputView: UIInputView {

    public var isDarkMode: Bool { traitCollection.userInterfaceStyle == .dark }

    override public init(frame: CGRect, inputViewStyle: UIInputView.Style) {
        super.init(frame: frame, inputViewStyle: inputViewStyle)

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
