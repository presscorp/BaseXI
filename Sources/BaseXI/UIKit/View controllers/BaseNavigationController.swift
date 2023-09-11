//
//  BaseNavigationController.swift
//
//
//  Created by Zhalgas Baibatyr on 28.07.2023.
//

import UIKit

open class BaseNavigationController: UINavigationController {

    open weak var baseNavigationDelegate: BaseNavigationDelegate?

    open var isDarkMode: Bool { traitCollection.userInterfaceStyle == .dark }

    deinit {
        if let customViewController = self as? ViewCustomizable {
            customViewController.destruct()
        }
    }

    override open func viewDidLoad() {
        super.viewDidLoad()
        delegate = self

        if let customViewController = self as? ViewCustomizable {
            customViewController.customize()
        }
    }

    override open func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if let customViewController = self as? ViewCustomizable {
            customViewController.restyleViews()
        }
    }
}

extension BaseNavigationController: UINavigationControllerDelegate {

    open func navigationController(
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
