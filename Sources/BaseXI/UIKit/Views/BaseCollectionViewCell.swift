//
//  BaseCollectionViewCell.swift
//
//
//  Created by Zhalgas Baibatyr on 01.08.2023.
//

import UIKit

public class BaseCollectionViewCell: UICollectionViewCell {

    public var isDarkMode: Bool { traitCollection.userInterfaceStyle == .dark }

    override public init(frame: CGRect) {
        super.init(frame: frame)

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
