//
//  BaseInputAccessoryView.swift
//
//
//  Created by Zhalgas Baibatyr on 01.08.2023.
//

import UIKit

open class BaseInputAccessoryView: BaseInputView {

    open weak var inputAccessoryViewDelegate: BaseInputAccessoryViewDelegate?

    private var observer: NSKeyValueObservation?

    deinit { observer?.invalidate() }

    override open func willMove(toSuperview newSuperview: UIView?) {
        observer?.invalidate()
        observer = newSuperview?.observe(\.center) { [weak self] _, _ in
            self?.didChangeFrame()
        }

        super.willMove(toSuperview: newSuperview)
    }

    override open func layoutSubviews() {
        super.layoutSubviews()
        didChangeFrame()
    }

    private func didChangeFrame() {
        guard let frame = superview?.frame, let inputAccessoryViewDelegate else { return }
        inputAccessoryViewDelegate.inputAccessoryView(didChangeFrame: frame)
    }
}
