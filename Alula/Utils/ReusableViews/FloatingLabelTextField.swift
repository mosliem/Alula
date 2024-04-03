//
//  Test.swift
//  Alula
//
//  Created by mohamed sliem on 03/04/2024.
//

import UIKit
import Utilits

@IBDesignable
class FloatingLabelTextField: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        fromNib()
        customPadding()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fromNib()
        customPadding()
    }
}

extension FloatingLabelTextField {
    func setupFloatingTextField(
        placeholder: String? = "",
        title: String? = "",
        icon: IconDesignSystem? = nil
    ){
        if let icon = icon?.iconImage {
            self.iconImageView.image = icon
        }
        self.textfield.placeholder = placeholder
        
        self.titleLabel.text = title
    }
}

extension FloatingLabelTextField {
    private func customPadding(){
        self.textfield.addPadding(side: .left, 8)
        self.textfield.addPadding(side: .right, 30)
    }
}
