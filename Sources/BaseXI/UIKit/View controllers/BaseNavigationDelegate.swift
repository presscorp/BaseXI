//
//  BaseNavigationDelegate.swift
//
//
//  Created by Zhalgas Baibatyr on 09.08.2023.
//

import UIKit

public protocol BaseNavigationDelegate: AnyObject {

    func navigationController(
        _ navigationController: UINavigationController,
        didShow viewController: UIViewController,
        animated: Bool
    )
}
