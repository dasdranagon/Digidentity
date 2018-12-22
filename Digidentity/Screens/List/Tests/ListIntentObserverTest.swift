//
//  ListIntentObserverTest.swift
//  Digidentity
//
//  Created by Denis Skokov on 14/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Nimble
import Quick

@testable import Digidentity

class ListIntentObserverTest: QuickSpec {
    
    override func spec() {
        var listPresenter: ListPresenter!
        var listWireframe: ListWireframeMock!
        var interactor: ListInteractorMock!
        var representation: ListRepresentationMock!
        
        beforeEach {
            listWireframe = ListWireframeMock()
            interactor = ListInteractorMock()
            representation = ListRepresentationMock()
            
            listPresenter = ListPresenter()
            listPresenter.wireframe = listWireframe
            listPresenter.interactor = interactor
            listPresenter.view = representation
        }
        
        describe("ready") {
            beforeEach {
                listPresenter.ready()
            }
            
            it("triggers interractor's setup") {
                expect(interactor.setupWasCalled) == true
            }
            
            it("shows top processing indicator") {
                expect(representation.processingIndicatorWasShowed) == true
                expect(representation.processingIndicatorLocation) == .top
            }
        }
        
        describe("addNewImage") {
            beforeEach {
                listPresenter.addNewImage()
            }
            
            it("navigates to the add image screen") {
                expect(listWireframe.addNewImageWasCalled) == true
            }
        }
        
        describe("passedFirst") {
            beforeEach {
                listPresenter.passedFirst()
            }
            
            it("shows top processing indicator") {
                expect(representation.processingIndicatorWasShowed) == true
                expect(representation.processingIndicatorLocation) == .top
            }
            
            it("asks interractor to fetch newest") {
                expect(interactor.fetchNewestWasCalled) == true
            }
        }
        
        describe("passedLast") {
            beforeEach {
                listPresenter.passedLast()
            }
            
            it("shows bottom processing indicator") {
                expect(representation.processingIndicatorWasShowed) == true
                expect(representation.processingIndicatorLocation) == .bottom
            }
            
            it("asks interractor to fetch next page") {
                expect(interactor.fetchNextPageWasCalled) == true
            }
        }
    }
}

