//
//  BaseCollectionView.swift
//
//
//  Created by Zhalgas Baibatyr on 01.08.2023.
//

import UIKit

open class BaseCollectionView: UICollectionView {

    open var isDarkMode: Bool { traitCollection.userInterfaceStyle == .dark }

    override public init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)

        if let customView = self as? ViewCustomizable {
            customView.customize()
        }
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        if let customView = self as? ViewCustomizable {
            customView.destruct()
        }
    }

    override open func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if let customView = self as? ViewCustomizable {
            customView.setRestylableProperties()
        }
    }

    private func reuseId<T: UIView>(for type: T.Type) -> String { String(describing: T.self) }

    open func register<T: UICollectionViewCell>(_: T.Type) {
        let reuseId = reuseId(for: T.self)
        register(T.self, forCellWithReuseIdentifier: reuseId)
    }

    open func register<T: UICollectionReusableView>(_: T.Type, forSupplementaryViewOfKind: String) {
        let reuseId = reuseId(for: T.self)
        register(T.self, forSupplementaryViewOfKind: forSupplementaryViewOfKind, withReuseIdentifier: reuseId)
    }

    open func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        let reuseId = reuseId(for: T.self)
        guard let cell = dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: " + reuseId)
        }
        return cell
    }

    open func dequeueReusableSupplementaryView<T: UICollectionReusableView>(
        ofKind: String,
        for indexPath: IndexPath
    ) -> T {
        let reuseId = reuseId(for: T.self)
        guard let cell = dequeueReusableSupplementaryView(
            ofKind: ofKind,
            withReuseIdentifier: reuseId,
            for: indexPath
        ) as? T else {
            fatalError("Could not dequeue supplementary view with identifier: " + reuseId)
        }
        return cell
    }
}
