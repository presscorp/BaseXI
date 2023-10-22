//
//  BaseTableHeaderFooterView.swift
//
//
//  Created by Zhalgas Baibatyr on 03.08.2023.
//

import UIKit

open class BaseTableHeaderFooterView: UITableViewHeaderFooterView {

    open var isDarkMode: Bool { traitCollection.userInterfaceStyle == .dark }

    override public init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

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
            customView.setRestylableProperties()
        }
    }
}
