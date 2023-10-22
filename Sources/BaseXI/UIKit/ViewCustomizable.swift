//
//  ViewCustomizable.swift
//
//
//  Created by Zhalgas Baibatyr on 27.07.2023.
//

/// Implementation of methods called in case of inheritance from the base view or view controller
public protocol ViewCustomizable: AnyObject {

    /// Addition and arrangement of subviews
    func setSubviews()

    /// Positioning of subviews via constraints
    func setLayoutConstraints()

    /// Set subviews' properties based on system (light / dark) mode
    func setRestylableProperties()

    /// Set subviews' properties
    func setStyleProperties()

    /// Fill subviews with content
    func setContent()

    /// Set actions
    func setActions()

    /// Perform custom cleanup during the class destruction
    func destruct()
}

public extension ViewCustomizable {

    func setSubviews() {}

    func setLayoutConstraints() {}

    func setRestylableProperties() {}

    func setStyleProperties() {}

    func setContent() {}

    func setActions() {}

    func destruct() {}

    func customize() {
        setSubviews()
        setLayoutConstraints()
        setRestylableProperties()
        setStyleProperties()
        setContent()
        setActions()
    }
}
