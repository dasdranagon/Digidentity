//
//  DefaultRequestManager.swift
//  Digidentity
//
//  Created by Denis Skokov on 12/16/18.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Foundation
import Alamofire

class DefaultRequestManager {
    private let sessionManager: SessionManager
    let configuration: NetworkConfiguration
    init(networkConfiguration: NetworkConfiguration) {
        configuration = networkConfiguration
        
        let path = Bundle.main.path(forResource: "cert", ofType: "der")!
        let data = NSData(contentsOfFile: path)!
        let certificate = SecCertificateCreateWithData(nil, data)!
        let trustPolicy = ServerTrustPolicy.pinCertificates(certificates: [certificate], validateCertificateChain: true, validateHost: true)
        let policies = ["marlove.net":trustPolicy]
        let policyManager = ServerTrustPolicyManager(policies: policies)
        self.sessionManager = SessionManager(serverTrustPolicyManager: policyManager)
    }
}

extension DefaultRequestManager: RequestManager {
    func execute<ResponseType>(request: NetworkRequest<ResponseType>, completion:  @escaping (Response<ResponseType>) -> ()) where ResponseType : Decodable {
        
        let url = configuration.baseUrl + "/" + request.path
        let method = request.method.alamofireHTTPMethod
        let params = request.parameters
        let encoding = request.encoding.alamofireEncoding
        let headers = configuration.headers
        
        let request = sessionManager.request(url, method: method, parameters: params, encoding: encoding, headers: headers)
        request.response { response in
            if let error = response.error {
                completion(.failure(error: error))
                return
            }
            guard let data = response.data else {
                completion(.failure(error: self.networkError(with: "Empty data")))
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let decodedObject = try decoder.decode(ResponseType.self, from: data)
                completion(.success(response: decodedObject))
            } catch {
                completion(.failure(error: error))
            }
        }
    }
    
    private func networkError(with description: String) -> Error {
        return NSError(domain: "digitentity.network.manager", code: 0, userInfo: [NSLocalizedDescriptionKey: description])
    }
}
