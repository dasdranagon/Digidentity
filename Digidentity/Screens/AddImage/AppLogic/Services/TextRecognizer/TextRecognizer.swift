//
//  TextRecognizer.swift
//  Digidentity
//
//  Created by Denis Skokov on 12/15/18.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Foundation

protocol TextRecognizer {
    typealias Completion = (String?)->()
    func recognize(image: Image, completion: @escaping Completion)
}
