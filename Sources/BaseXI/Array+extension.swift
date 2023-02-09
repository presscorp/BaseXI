//
//  Array+extension.swift
//  
//
//  Created by Zhalgas on 09.02.2023.
//

extension Array {

    public subscript(safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
