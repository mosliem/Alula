//
//  Password.swift
//  Alula
//
//  Created by mohamed sliem on 09/05/2024.
//

import Foundation

@propertyWrapper
struct Password{
    var wrappedValue: String
    var projectedValue: Bool {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPred.evaluate(with: wrappedValue)
    }
}
