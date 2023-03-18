//
//  Decimal+extension.swift
//  
//
//  Created by Zhalgas on 14.02.2023.
//

import Foundation

public extension Decimal {

    var displayedAmount: String? { getDisplayedAmount(minimumFractionDigits: 2) }

    var optionalFractionDisplayedAmount: String? { getDisplayedAmount(minimumFractionDigits: 0) }

    func getDisplayedAmount(minimumFractionDigits: Int) -> String? {
        let number = NSDecimalNumber(decimal: self)
        let numberFormatter = NumberFormatter()
        numberFormatter.decimalSeparator = "."
        numberFormatter.groupingSeparator = " "
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = minimumFractionDigits
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter.string(from: number)
    }

    func round(toPlaces decimalPlaces: Int) -> Decimal {
        var value = self
        var rounded = Self()
        NSDecimalRound(&rounded, &value, decimalPlaces, .bankers)
        return rounded
    }

    var integerDigitsCount: Int { (self as NSDecimalNumber).intValue.description.count }

    var fractionDigitsCount: Int { max(-exponent, 0) }
}
