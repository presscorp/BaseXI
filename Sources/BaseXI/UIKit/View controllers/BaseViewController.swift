//
//  BaseViewController.swift
//
//
//  Created by Zhalgas Baibatyr on 27.07.2023.
//

import UIKit

open class BaseViewController: UIViewController {

    open var isDarkMode: Bool { traitCollection.userInterfaceStyle == .dark }

    override open func viewDidLoad() {
        super.viewDidLoad()

        if let customViewController = self as? ViewCustomizable {
            customViewController.customize()
        }
    }

    deinit {
        if let customViewController = self as? ViewCustomizable {
            customViewController.destruct()
        }
    }

    override open func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if let customViewController = self as? ViewCustomizable {
            customViewController.restyleViews()
        }
    }
}
