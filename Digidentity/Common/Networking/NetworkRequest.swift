//
//  NetworkRequest.swift
//  Digidentity
//
//  Created by Denis Skokov on 12/16/18.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Foundation

class NetworkRequest<ResponseType: Decodable> {
    typealias RequestParameters = [String: Any]
    
    let path: String
    let method: RequestMethod
    let encoding: RequestParametersEncoding
    let parameters: RequestParameters?
    
    init(path: String, method: RequestMethod, encoding: RequestParametersEncoding, parameters: RequestParameters?) {
        self.path = path
        self.method = method
        self.encoding = encoding
        self.parameters = parameters
    }
}
