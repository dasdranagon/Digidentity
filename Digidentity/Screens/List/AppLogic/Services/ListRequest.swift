//
//  ListRequest.swift
//  Digidentity
//
//  Created by Denis Skokov on 12/16/18.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Foundation

class ListRequest: NetworkRequest<[ListItem]> {
    init(sinceId: String?, maxId: String?) {
        
        var params: Dictionary<String, String> = [:]
        if let sinceId = sinceId {
            params = ["since_id" : sinceId]
        }
        if let maxId = maxId {
            params["since_id"] = maxId
        }
        
        super.init(path: "items", method: .get, encoding: .url, parameters: params)
    }
}
