//
//  BaseTableViewController.swift
//
//
//  Created by Zhalgas Baibatyr on 28.07.2023.
//

import UIKit

open class BaseTableViewController: UITableViewController {

    open var customRefreshControl: UIRefreshControl?

    open var isDarkMode: Bool { traitCollection.userInterfaceStyle == .dark }

    open var refreshingIsAllowed = false {
        didSet {
            if refreshingIsAllowed == oldValue { return }
            if refreshingIsAllowed {
                customRefreshControl = UIRefreshControl()
                tableView.backgroundView = customRefreshControl
            } else {
                customRefreshControl = nil
                tableView.backgroundView = nil
            }
        }
    }

    deinit {
        if let customViewController = self as? ViewCustomizable {
            customViewController.destruct()
        }
    }

    override open func viewDidLoad() {
        super.viewDidLoad()

        tableView.separatorStyle = .none

        if let customViewController = self as? ViewCustomizable {
            customViewController.customize()
        }
    }

    override open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override open func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if let customViewController = self as? ViewCustomizable {
            customViewController.setRestylableProperties()
        }
    }

    private func reuseId<T: UIView>(for type: T.Type) -> String { String(describing: T.self) }

    open func register<T: UITableViewCell>(_: T.Type) {
        let reuseId = reuseId(for: T.self)
        tableView.register(T.self, forCellReuseIdentifier: reuseId)
    }

    open func register<T: UITableViewHeaderFooterView>(_: T.Type) {
        let reuseId = reuseId(for: T.self)
        tableView.register(T.self, forHeaderFooterViewReuseIdentifier: reuseId)
    }

    open func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        let reuseId = reuseId(for: T.self)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: " + reuseId)
        }
        return cell
    }

    open func dequeueReusableHeaderFooter<T: UITableViewHeaderFooterView>() -> T {
        let reuseId = reuseId(for: T.self)
        guard let headerFooter = tableView.dequeueReusableHeaderFooterView(withIdentifier: reuseId) as? T else {
            fatalError("Could not dequeue cell with identifier: " + reuseId)
        }
        return headerFooter
    }
}
