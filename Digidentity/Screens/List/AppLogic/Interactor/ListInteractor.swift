//
//  ListInteractor.swift
//  Digidentity
//
//  Created by Denis Skokov on 14/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Foundation

protocol ListInteractor: AnyObject {
    func setup()
    func fetchNewest()
    func fetchNextPage()
}

protocol ListInteractorOutput: AnyObject {
    func update(items: [ListItem])
    func append(items: [ListItem])
    func fail()
}
