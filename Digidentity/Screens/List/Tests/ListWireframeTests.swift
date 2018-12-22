//
//  ListWireframeTests.swift
//  Digidentity
//
//  Created by Denis Skokov on 13/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Nimble
import Quick

@testable import Digidentity

class ListWireframeTests: QuickSpec {
    
    override func spec() {
        var listWireframe: DefaultListWireframe!
        
        var navigator: NavigatorMock!
        var addImageWireframe: WireframeMock!
        
        beforeEach {
            navigator = NavigatorMock()
            addImageWireframe = WireframeMock()
            
            listWireframe = DefaultListWireframe(navigator: navigator)
            listWireframe.addImageWireframe = addImageWireframe
        }
        
        describe("addNewImage") {
            beforeEach {
                listWireframe.addNewImage()
            }
            
            it("activates add image screen") {
                expect(addImageWireframe.activateWasCalled) == true
            }
        }
        
    }
}
