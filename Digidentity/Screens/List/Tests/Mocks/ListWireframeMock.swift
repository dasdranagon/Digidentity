//
//  ListWireframeMock.swift
//  Digidentity
//
//  Created by Denis Skokov on 14/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Foundation

@testable import Digidentity

class ListWireframeMock: ListWireframe {
    
    var addNewImageWasCalled = false
    func addNewImage() {
        addNewImageWasCalled = true
    }
}
