//
//  ListInteractorMock.swift
//  Digidentity
//
//  Created by Denis Skokov on 17/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Foundation

@testable import Digidentity

class ListInteractorMock: ListInteractor {
    
    var setupWasCalled = false
    func setup() {
        setupWasCalled = true
    }
    
    var fetchNewestWasCalled = false
    func fetchNewest() {
        fetchNewestWasCalled = true
    }
    
    var fetchNextPageWasCalled = false
    func fetchNextPage() {
        fetchNextPageWasCalled = true
    }
}
