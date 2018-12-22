//
//  AddImageIntentObserver.swift
//  Digidentity
//
//  Created by Denis Skokov on 13/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Foundation

protocol AddImageIntentObserver: AnyObject {
    func ready()
    func close()
    func takePhoto()
    func upload()
}
