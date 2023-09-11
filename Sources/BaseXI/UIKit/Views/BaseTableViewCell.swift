//
//  BaseTableViewCell.swift
//
//
//  Created by Zhalgas Baibatyr on 28.07.2023.
//

import UIKit

public class BaseTableViewCell: UITableViewCell {

    public var isDarkMode: Bool { traitCollection.userInterfaceStyle == .dark }

    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        if let customView = self as? ViewCustomizable {
            customView.customize()
        }
    }

    required init?(coder: NSCoder) {
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
