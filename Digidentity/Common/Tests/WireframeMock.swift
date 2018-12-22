//
//  WireframeMock.swift
//  Digidentity
//
//  Created by Denis Skokov on 13/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

@testable import Digidentity

class WireframeMock: Wireframe {
    
    var activateWasCalled = false
    func activate() {
        activateWasCalled = true
    }
    
    var deactivateWasCalled = false
    func deactivate() {
        deactivateWasCalled = true
    }
}
