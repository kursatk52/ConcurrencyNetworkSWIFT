//
//  APIErrors.swift
//  ConcurrencyAndNetwork
//
//  Created by Kursat Korkmaz on 13.02.2023.
//

import Foundation

enum APIErrors : Error{
    case URLError
    case FetchError
    case ServerError
    case DataDecodingError
}
