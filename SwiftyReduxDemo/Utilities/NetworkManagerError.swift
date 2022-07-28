//
//  NetworkManagerError.swift
//  SwiftyReduxDemo
//
//  Created by max on 27.07.2022.
//

import Foundation

enum NetworkManagerError: Error {
    case badResponse(URLResponse)
    case badLocalUrl
    case invalidRequest
    case parsingError
    case badData
}
