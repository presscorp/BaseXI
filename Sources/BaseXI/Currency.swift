//
//  Currency.swift
//  
//
//  Created by Zhalgas on 14.02.2023.
//

public enum Currency: String, Equatable, CaseIterable, Codable {

    case KZT, USD, EUR, GBP, RUB, CAD, CNY, CHF

    public var code: RawValue { rawValue }

    public var symbol: String {
        switch self {
        case .KZT: return "₸"
        case .USD, .CAD: return "$"
        case .EUR: return "€"
        case .GBP: return "£"
        case .RUB: return "₽"
        case .CNY: return "¥"
        case .CHF: return "₣"
        }
    }

    public var flag: String {
        switch self {
        case .KZT: return "🇰🇿"
        case .USD: return "🇺🇸"
        case .EUR: return "🇪🇺"
        case .GBP: return "🇬🇧"
        case .RUB: return "🇷🇺"
        case .CAD: return "🇨🇦"
        case .CNY: return "🇨🇳"
        case .CHF: return "🇨🇭"
        }
    }

    public init?(code: RawValue) { self.init(rawValue: code) }
}
