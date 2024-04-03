//
//  FontSystem.swift
//  Alula
//
//  Created by mohamed sliem on 03/04/2024.
//

import UIKit

enum FontSystem {
    case NeueHaasBold
    case NeueHaasMedui
    case NeueHaasRoman
}

extension FontSystem {
    static func font( _ font: FontSystem, size: CGFloat) -> UIFont? {
        switch font {
            case .NeueHaasBold:
                return UIFont(name: "NeueHaasDisplayBold", size: size)
            case .NeueHaasMedui:
                return UIFont(name: "NeueHaasDisplayMediu", size: size)
            case .NeueHaasRoman:
                return UIFont(name: "NeueHaasDisplayRoman", size: size)
        }
    }
}
