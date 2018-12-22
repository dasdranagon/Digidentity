//
//  ListGateway.swift
//  Digidentity
//
//  Created by Denis Skokov on 14/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Foundation

protocol ListGateway {
    typealias Completion = (ListResponse)->()
    func fetch(sinceId: String?, maxId: String?, completion: @escaping Completion)
}
