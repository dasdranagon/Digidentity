//
//  RequestMethod.swift
//  Digidentity
//
//  Created by Denis Skokov on 12/16/18.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Alamofire

enum RequestMethod {
    case get
    case post
}

extension RequestMethod {
    var alamofireHTTPMethod: HTTPMethod {
        switch self {
        case .get: return .get
        case .post: return .post
        }
    }
}
