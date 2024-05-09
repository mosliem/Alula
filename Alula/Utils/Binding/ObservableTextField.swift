//
//  ObservableTextField.swift
//  Alula
//
//  Created by mohamed sliem on 09/05/2024.
//

import UIKit
import ObjectiveC.runtime

var IdentifiableObserverKey = "kIdentifiableObserverKey"

protocol observableTextField: UITextField {
    func bind(observer: @escaping (String) -> Void)
}

extension observableTextField {
    
    var textDidChanged: (String) -> Void {
        get {
            return (objc_getAssociatedObject(self, &IdentifiableObserverKey)) as! (String) -> Void
        }
        set {
            objc_setAssociatedObject(self, &IdentifiableObserverKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    func bind(observer: @escaping (String) -> Void){
        listenToChanges()
        textDidChanged = observer
    }
    
}


extension UITextField: observableTextField {
    func listenToChanges(){
        self.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
    }
    
    @objc func editingChanged(textField: UITextField) {
        if let text = textField.text {
            textDidChanged(text)
        }
    }
    
}
