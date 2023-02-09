//
//  WidgetFamily.swift
//  
//
//  Created by Zhalgas on 09.02.2023.
//

import SwiftUI
import WidgetKit

@available(iOS 14.0, *)
extension WidgetFamily {

    public var widgetHeight: CGFloat { widgetSize.height }
    
    var widgetSize: CGSize {
        
        // Sizes were taken from
        // https://developer.apple.com/design/human-interface-guidelines/components/system-experiences/widgets
        
        switch self {
        case .systemSmall:
            switch UIScreen.main.bounds.size {
            case CGSize(width: 430, height: 932): return CGSize(width: 170, height: 170)
            case CGSize(width: 428, height: 926): return CGSize(width: 170, height: 170)
            case CGSize(width: 414, height: 896): return CGSize(width: 169, height: 169)
            case CGSize(width: 414, height: 736): return CGSize(width: 159, height: 159)
            case CGSize(width: 393, height: 852): return CGSize(width: 158, height: 158)
            case CGSize(width: 390, height: 844): return CGSize(width: 158, height: 158)
            case CGSize(width: 375, height: 812): return CGSize(width: 155, height: 155)
            case CGSize(width: 375, height: 667): return CGSize(width: 148, height: 148)
            case CGSize(width: 360, height: 780): return CGSize(width: 155, height: 155)
            case CGSize(width: 320, height: 568): return CGSize(width: 141, height: 141)
            default: return CGSize(width:155, height: 155)
            }
        case .systemMedium:
            switch UIScreen.main.bounds.size {
            case CGSize(width: 430, height: 932): return CGSize(width: 364, height: 170)
            case CGSize(width: 428, height: 926): return CGSize(width: 364, height: 170)
            case CGSize(width: 414, height: 896): return CGSize(width: 360, height: 169)
            case CGSize(width: 414, height: 736): return CGSize(width: 348, height: 159)
            case CGSize(width: 393, height: 852): return CGSize(width: 338, height: 158)
            case CGSize(width: 390, height: 844): return CGSize(width: 338, height: 158)
            case CGSize(width: 375, height: 812): return CGSize(width: 329, height: 155)
            case CGSize(width: 375, height: 667): return CGSize(width: 321, height: 148)
            case CGSize(width: 360, height: 780): return CGSize(width: 329, height: 155)
            case CGSize(width: 320, height: 568): return CGSize(width: 292, height: 141)
            default: return CGSize(width:329, height: 155)
            }
        case .systemLarge:
            switch UIScreen.main.bounds.size {
            case CGSize(width: 430, height: 932): return CGSize(width: 364, height: 382)
            case CGSize(width: 428, height: 926): return CGSize(width: 364, height: 382)
            case CGSize(width: 414, height: 896): return CGSize(width: 360, height: 379)
            case CGSize(width: 414, height: 736): return CGSize(width: 348, height: 357)
            case CGSize(width: 393, height: 852): return CGSize(width: 338, height: 354)
            case CGSize(width: 390, height: 844): return CGSize(width: 338, height: 354)
            case CGSize(width: 375, height: 812): return CGSize(width: 329, height: 345)
            case CGSize(width: 375, height: 667): return CGSize(width: 321, height: 324)
            case CGSize(width: 360, height: 780): return CGSize(width: 329, height: 345)
            case CGSize(width: 320, height: 568): return CGSize(width: 292, height: 311)
            default: return CGSize(width:329, height: 345)
            }
        default:
            fatalError("Unsupported size")
        }
    }
}
