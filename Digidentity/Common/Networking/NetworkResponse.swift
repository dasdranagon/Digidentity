//
//  NetworkResponse.swift
//  Digidentity
//
//  Created by Denis Skokov on 12/16/18.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Foundation

enum Response<ResponseType> {
    case success(response: ResponseType)
    case failure(error: Error)
}
