//
//  Observable.swift
//  Alula
//
//  Created by mohamed sliem on 27/03/2024.
//

import Foundation


class Observable<State>{
    
    var value: State {
        didSet{
            observer?(value)
        }
    }
    
    var observer: ((State) -> ())? {
        didSet{
            observer?(value)
        }
    }
    
    init(_ wrappedValue: State) {
        self.value = wrappedValue
    }
    
}
