//
//  FocusView.swift
//  
//
//  Created by Zhalgas Baibatyr on 13.06.2023.
//

import SwiftUI

@available(iOS 15.0, *)
fileprivate struct FocusView: ViewModifier {

    @FocusState private var focused: Bool
    @Binding private var value: Bool

    init(_ bindedValue: Binding<Bool>) {
        _value = bindedValue
        focused = bindedValue.wrappedValue
    }

    func body(content: Content) -> some View {
        content
            .focused($focused)
            .onChange(of: value) { newValue in
                focused = newValue
            } .onChange(of: focused) { newValue in
                value = newValue
            } .onAppear {
                if value {
                    focused = true
                }
            }
    }
}

extension View {

    @ViewBuilder
    func focused(_ bindedValue: Binding<Bool>) -> some View {
        if #available(iOS 15.0, *) {
            modifier(FocusView(bindedValue))
        } else {
            self
        }
    }
}
