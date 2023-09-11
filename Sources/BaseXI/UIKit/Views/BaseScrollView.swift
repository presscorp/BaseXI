//
//  BaseScrollView.swift
//
//
//  Created by Zhalgas Baibatyr on 31.07.2023.
//

import UIKit

open class BaseScrollView: UIScrollView {

    public let contentView = UIView()

    override public init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(contentView)
        setLayoutConstraints()

        alwaysBounceVertical = true
        contentView.layoutMargins = .zero
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        if let customView = self as? ViewCustomizable {
            customView.destruct()
        }
    }

    private func setLayoutConstraints() {
        var layoutConstraints = [NSLayoutConstraint]()

        contentView.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            contentView.widthAnchor.constraint(equalTo: widthAnchor),
            contentView.centerXAnchor.constraint(equalTo: centerXAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]

        NSLayoutConstraint.activate(layoutConstraints)
    }
}
