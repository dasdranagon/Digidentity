//
//  AddImageRequest.swift
//  Digidentity
//
//  Created by Denis Skokov on 12/16/18.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Foundation

class AddImageRequest: NetworkRequest<ListItem> {
    init(base64Image: String, text: String, confidence: Double) {
        let params = [ "image": base64Image,
                       "text": text,
                       "confidence": 0.7] as [String : Any]
        
        super.init(path: "item", method: .post, encoding: .json, parameters: params)
    }
}
