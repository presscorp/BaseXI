//
//  InputLine.swift
//  
//
//  Created by Zhalgas Baibatyr on 13.06.2023.
//

import SwiftUI

public struct InputLine: View {

    let title: String
    let text: Binding<String>
    var strokeColor = Color.gray
    var textColor = Color.black
    var scale: CGFloat = 1

    @State private var isFocused = false

    private var minimizeTitle: Bool { isFocused || !text.wrappedValue.isEmpty }
    private var titleFont: Font { .system(size: scale * (minimizeTitle ? 12 : 17)) }
    private var textFont: Font { .system(size: scale * 17) }
    private var titleYOffset: CGFloat { scale * (minimizeTitle ? -18 : 0) }

    public var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .leading) {
                TextField("", text: text)
                    .focused($isFocused)
                    .font(textFont)
                    .foregroundColor(textColor)
                    .colorMultiply(textColor)
                Text(title)
                    .font(titleFont)
                    .foregroundColor(strokeColor)
                    .offset(y: titleYOffset)
                    .allowsHitTesting(false)
                    .animation(.linear(duration: 0.2), value: isFocused)
            } .frame(height: scale * 32)

            Rectangle()
                .foregroundColor(strokeColor)
                .frame(height: scale)
        }
    }
}
