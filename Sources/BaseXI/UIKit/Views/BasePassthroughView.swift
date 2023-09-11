//
//  BasePassthroughView.swift
//
//
//  Created by Zhalgas Baibatyr on 27.07.2023.
//

import UIKit

open class BasePassthroughView: BaseView {

    override public func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        return view == self ? nil : view
    }
}
