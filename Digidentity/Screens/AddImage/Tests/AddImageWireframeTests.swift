//
//  AddImageWireframeTests.swift
//  Digidentity
//
//  Created by Denis Skokov on 13/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Nimble
import Quick

@testable import Digidentity

class AddImageWireframeTests: QuickSpec {
    
    override func spec() {
        var addImageWireframe: DefaultAddImageWireframe!
        
        var navigator: NavigatorMock!
        
        beforeEach {
            navigator = NavigatorMock()
            
            addImageWireframe = DefaultAddImageWireframe(navigator: navigator)
        }
        
        describe("close") {
            beforeEach {
                addImageWireframe.close()
            }
            
            it("pops last presented screen") {
                expect(navigator.popWasCalled) == true
            }
        }
        
    }
}

