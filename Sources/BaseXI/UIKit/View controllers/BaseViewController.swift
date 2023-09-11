//
//  BaseViewController.swift
//
//
//  Created by Zhalgas Baibatyr on 27.07.2023.
//

import UIKit

public class BaseViewController: UIViewController {

    var isDarkMode: Bool { traitCollection.userInterfaceStyle == .dark }

    override public func viewDidLoad() {
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

    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if let customViewController = self as? ViewCustomizable {
            customViewController.restyleViews()
        }
    }
}
