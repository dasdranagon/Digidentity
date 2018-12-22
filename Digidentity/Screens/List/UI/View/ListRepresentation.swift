//
//  ListRepresentation.swift
//  Digidentity
//
//  Created by Denis Skokov on 12/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Foundation

enum ProcessingIndicatorLocation {
    case top
    case bottom
}

protocol ListRepresentation: AnyObject {
    func update(items:[ListDisplayItem])
    func append(items:[ListDisplayItem])
    func processing(at: ProcessingIndicatorLocation, show: Bool)
}
