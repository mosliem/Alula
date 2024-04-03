//
//  NetworkError.swift
//  Alula
//
//  Created by mohamed sliem on 27/03/2024.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case requestError
    case requestFailed
    case encodingFailed
    case decodingError
    case custom(statusCode: Int)
}
