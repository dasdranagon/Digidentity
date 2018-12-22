//
//  ListRepresentationMock.swift
//  Digidentity
//
//  Created by Denis Skokov on 17/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Foundation

@testable import Digidentity

class ListRepresentationMock: ListRepresentation {
    
    var itemsToUpdate: [ListDisplayItem]?
    func update(items: [ListDisplayItem]) {
        itemsToUpdate = items
    }
    
     var itemsToAppend: [ListDisplayItem]?
    func append(items: [ListDisplayItem]) {
        itemsToAppend = items
    }
    
    var processingIndicatorLocation: ProcessingIndicatorLocation?
    var processingIndicatorWasShowed: Bool?
    func processing(at: ProcessingIndicatorLocation, show: Bool) {
        processingIndicatorLocation = at
        processingIndicatorWasShowed = show
    }
    
}
