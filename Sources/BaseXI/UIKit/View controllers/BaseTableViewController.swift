//
//  BaseTableViewController.swift
//
//
//  Created by Zhalgas Baibatyr on 28.07.2023.
//

import UIKit

public class BaseTableViewController: UITableViewController {

    private var customRefreshControl: UIRefreshControl?

    public var isDarkMode: Bool { traitCollection.userInterfaceStyle == .dark }

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

    override public func viewDidLoad() {
        super.viewDidLoad()

        tableView.separatorStyle = .none

        if let customViewController = self as? ViewCustomizable {
            customViewController.customize()
        }
    }

    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if let customViewController = self as? ViewCustomizable {
            customViewController.restyleViews()
        }
    }

    private func reuseId<T: UIView>(for type: T.Type) -> String { String(describing: T.self) }

    public func register<T: UITableViewCell>(_: T.Type) {
        let reuseId = reuseId(for: T.self)
        tableView.register(T.self, forCellReuseIdentifier: reuseId)
    }

    public func register<T: UITableViewHeaderFooterView>(_: T.Type) {
        let reuseId = reuseId(for: T.self)
        tableView.register(T.self, forHeaderFooterViewReuseIdentifier: reuseId)
    }

    public func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        let reuseId = reuseId(for: T.self)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: " + reuseId)
        }
        return cell
    }

    public func dequeueReusableHeaderFooter<T: UITableViewHeaderFooterView>() -> T {
        let reuseId = reuseId(for: T.self)
        guard let headerFooter = tableView.dequeueReusableHeaderFooterView(withIdentifier: reuseId) as? T else {
            fatalError("Could not dequeue cell with identifier: " + reuseId)
        }
        return headerFooter
    }
}
