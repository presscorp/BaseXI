//
//  SizeReader.swift
//  
//
//  Created by Zhalgas Baibatyr on 15.06.2023.
//

import SwiftUI

fileprivate struct SizeReader: ViewModifier {

    @Binding var size: CGSize

    func body(content: Content) -> some View {
        content.background(
            GeometryReader { geometry in
                Color.clear.onAppear { size = geometry.size }
            }
        )
    }
}

public extension View {

    func readSize(_ bindedSize: Binding<CGSize>) -> some View {
        modifier(SizeReader(size: bindedSize))
    }
}
