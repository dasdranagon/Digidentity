//
//  ListItem.swift
//  Digidentity
//
//  Created by Denis Skokov on 14/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Foundation

struct ListItem: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case image
        case text
        case confidence
    }
    
    let id: String
    let image: Image
    let text: String
    let confidence: Double

    init(id: String, image: Image, text: String, confidence: Double) {
        self.id = id
        self.image = image
        self.text = text
        self.confidence = confidence
    }
}
