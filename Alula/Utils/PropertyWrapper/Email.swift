//
//  Email.swift
//  Alula
//
//  Created by mohamed sliem on 09/05/2024.
//

import Foundation

@propertyWrapper
struct Email {
    
    var wrappedValue: String
    
    var projectedValue: Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailPred.evaluate(with: wrappedValue)
    }
}
