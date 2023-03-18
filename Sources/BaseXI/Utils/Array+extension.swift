//
//  Array+extension.swift
//  
//
//  Created by Zhalgas on 09.02.2023.
//

public extension Array {

    subscript(safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
