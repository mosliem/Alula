//
//  IconSystem.swift
//  Alula
//
//  Created by mohamed sliem on 03/04/2024.
//

import Foundation
import UIKit

enum IconDesignSystem {
    case nameIcon
    case emailIcon
    case passwordIcon
}

extension IconDesignSystem {
    var iconImage: UIImage {
        switch self {
            case .nameIcon:
                return UIImage(resource: .personIcon)
            case .emailIcon:
                return UIImage(resource: .emailIcon)
            case .passwordIcon:
                return UIImage(resource: .eyeIcon)
        }
    }
}
