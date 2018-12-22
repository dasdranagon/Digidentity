//
//  AddImageGateway.swift
//  Digidentity
//
//  Created by Denis Skokov on 12/15/18.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Foundation

protocol AddImageGateway {
    typealias Completion = (AddImageResponse)->()
    func upload(base64Image: String, text: String, confidence: Double, completion: @escaping Completion)
}
