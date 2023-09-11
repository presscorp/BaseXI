//
//  BaseInputAccessoryViewDelegate.swift
//
//
//  Created by Zhalgas Baibatyr on 01.08.2023.
//

import Foundation

public protocol BaseInputAccessoryViewDelegate: AnyObject {

    func inputAccessoryView(didChangeFrame rect: CGRect)
}
