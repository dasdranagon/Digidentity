//
//  StubTextRecognizer.swift
//  Digidentity
//
//  Created by Denis Skokov on 12/16/18.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Foundation

class StubTextRecognizer: TextRecognizer {
    func recognize(image: Image, completion: @escaping Completion) {
        let text = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
"""
        completion(text)
    }
}
