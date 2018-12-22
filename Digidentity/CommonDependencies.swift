//
//  CommonDependencies.swift
//  Digidentity
//
//  Created by Denis Skokov on 13/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Foundation

struct CommonDependencies {
    static var shared: CommonDependencies!
    
    let navigator: Navigator
    let storage: Storage
    let requestManager: RequestManager
}
