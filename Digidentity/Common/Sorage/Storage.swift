//
//  Storage.swift
//  Digidentity
//
//  Created by Denis Skokov on 14/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Foundation

protocol Storage: AnyObject {
    typealias Completion = ([ListItem])->()
    func fetch(completion: @escaping Completion)
    func update(items:[ListItem])
}
