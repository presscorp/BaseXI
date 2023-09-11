//
//  BaseNavigationController.swift
//
//
//  Created by Zhalgas Baibatyr on 28.07.2023.
//

import UIKit

open class BaseNavigationController: UINavigationController {

    public weak var baseNavigationDelegate: BaseNavigationDelegate?

    public var isDarkMode: Bool { traitCollection.userInterfaceStyle == .dark }

    deinit {
        if let customViewController = self as? ViewCustomizable {
            customViewController.destruct()
        }
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        delegate = self

        if let customViewController = self as? ViewCustomizable {
            customViewController.customize()
        }
    }

    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if let customViewController = self as? ViewCustomizable {
            customViewController.restyleViews()
        }
    }
}

extension BaseNavigationController: UINavigationControllerDelegate {

    public func navigationController(
        _ navigationController: UINavigationController,
        didShow viewController: UIViewController,
        animated: Bool
    ) {
        baseNavigationDelegate?.navigationController(
            navigationController,
            didShow: viewController,
            animated: animated
        )
    }
}
