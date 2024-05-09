//
//  UtilsModel.swift
//  Alula
//
//  Created by mohamed sliem on 09/05/2024.
//

import UIKit

struct AlertActionModel{
    var title: String!
    var style: UIAlertAction.Style!
    var handler: ((UIAlertAction) -> Void)?
}
