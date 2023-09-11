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

    /// Stylization of subviews' properties
    func stylizeViews()

    /// Update subviews' properties based on system (light / dark) mode
    func restyleViews()

    /// Set actions to UI elements
    func setActions()

    /// Fill subviews with content
    func fillWithContent()

    /// Perform actions when view is loaded into memory
    func performActionsOnViewDidLoad()

    /// Perform custom cleanup during the class destruction
    func destruct()
}

public extension ViewCustomizable {

    func setSubviews() {}

    func setLayoutConstraints() {}

    func stylizeViews() {}

    func restyleViews() {}

    func setActions() {}

    func fillWithContent() {}

    func performActionsOnViewDidLoad() {}

    func destruct() {}

    func customize() {
        setSubviews()
        setLayoutConstraints()
        stylizeViews()
        setActions()
        fillWithContent()
        performActionsOnViewDidLoad()
    }
}
