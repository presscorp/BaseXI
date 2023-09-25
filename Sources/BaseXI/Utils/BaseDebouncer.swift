//
//  BaseDebouncer.swift
//  
//
//  Created by Zhalgas Baibatyr on 26.09.2023.
//

import Foundation

/// Debounced action provider
public class BaseDebouncer {

    /// Create debounced action
    /// - Parameters:
    ///   - queue: Queue to perform asyncronous action after debounce time
    ///   - time: Debounce interval in milliseconds
    ///   - intermediateAction: Action that is performed immidiatly on debounce before expected final action
    ///   - finalAction: Action to debounce
    /// - Returns: Debounced action
    public static func debouncedAction(
        queue: DispatchQueue,
        time: Int,
        intermediateAction: @escaping () -> Void = {},
        finalAction: @escaping () -> Void
    ) -> () -> Void {
        var debouncedActionTime = DispatchTime.distantFuture
        var finalActionTime: DispatchTime { debouncedActionTime + .milliseconds(time) }

        return {
            debouncedActionTime = .now()
            intermediateAction()
            queue.asyncAfter(deadline: finalActionTime) {
                if .now() < finalActionTime { return }
                finalAction()
            }
        }
    }
}
