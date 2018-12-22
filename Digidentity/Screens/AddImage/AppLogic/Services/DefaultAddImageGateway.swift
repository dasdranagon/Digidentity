//
//  DefaultAddImageGateway.swift
//  Digidentity
//
//  Created by Denis Skokov on 12/15/18.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Foundation
import Alamofire

class DefaultAddImageGateway {
    let requestManager: RequestManager!
    init(requestManager: RequestManager) {
        self.requestManager = requestManager
    }
}

extension DefaultAddImageGateway: AddImageGateway {
    func upload(base64Image: String, text: String,
                confidence: Double, completion: @escaping (AddImageResponse) -> ()) {
        
        let addImageRequest = AddImageRequest(base64Image: base64Image, text: text, confidence: confidence)
        requestManager.execute(request: addImageRequest) { response in
            completion(response)
        }
    }
}
