//
//  RequestManager.swift
//  Digidentity
//
//  Created by Denis Skokov on 12/16/18.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Foundation

protocol RequestManager {
    func execute<ResponseType: Decodable>(request: NetworkRequest<ResponseType>,
                               completion: @escaping (Response<ResponseType>)->())
}
