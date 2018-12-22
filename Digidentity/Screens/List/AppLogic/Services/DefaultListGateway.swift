//
//  DefaultListGateway.swift
//  Digidentity
//
//  Created by Denis Skokov on 14/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Foundation
import Alamofire

class DefaultListGateway: ListGateway {
    let requestManager: RequestManager!
    init(requestManager: RequestManager) {
        self.requestManager = requestManager
    }
    
    func fetch(sinceId: String?, maxId: String?, completion: @escaping Completion) {
        let request = ListRequest(sinceId: sinceId, maxId: maxId)
        
        requestManager.execute(request: request) { response in
            completion(response)
        }
    }
}
