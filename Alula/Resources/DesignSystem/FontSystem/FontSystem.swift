//
//  FontSystem.swift
//  Alula
//
//  Created by mohamed sliem on 03/04/2024.
//

import UIKit

enum FontSystem {
    case defaultFont
    case neueHaasBold
    case neueHaasMedui
    case neueHaasRoman
}

extension FontSystem {
    static func font( _ font: FontSystem, size: CGFloat) -> UIFont? {
        switch font {
        case .neueHaasBold:
            return UIFont(name: "NeueHaasDisplay-Bold", size: size)
        case .neueHaasMedui:
            return UIFont(name: "NeueHaasDisplay-Mediu", size: size)
        case .neueHaasRoman:
            return UIFont(name: "NeueHaasDisplay-Roman", size: size)
        case .defaultFont:
            return UIFont.systemFont(ofSize: size, weight: .medium)
        }
    }
}
