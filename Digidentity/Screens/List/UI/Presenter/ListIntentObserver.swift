//
//  ListIntentObserver.swift
//  Digidentity
//
//  Created by Denis Skokov on 12/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Foundation

protocol ListIntentObserver {
    func ready()
    func addNewImage()
    func passedFirst()
    func passedLast()
}
