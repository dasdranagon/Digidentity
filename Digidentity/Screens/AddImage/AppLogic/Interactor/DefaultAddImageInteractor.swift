//
//  DefaultAddImageInteractor.swift
//  Digidentity
//
//  Created by Denis Skokov on 12/15/18.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Foundation

class DefaultAddImageInteractor {
    var textRecognizer: TextRecognizer!
    private let gateway: AddImageGateway
    private var image: Image?
    private var text: String?
    
    weak var outout: AddImageInteractorOutput!
    weak var errorHandler: ErrorHandler?
    
    init(gateway: AddImageGateway) {
        self.gateway = gateway
    }
}

extension DefaultAddImageInteractor: AddImageInteractor {
    func process(image: Image) {
        self.image = image
        textRecognizer.recognize(image: image) { [weak self] text in
            guard let text = text else { return }
            
            self?.text = text
            self?.outout.recognized(text: text)
        }
    }
    
    func upload() {
        guard let text = text else { return }
        guard let image = image else { return }
        
        let base64str = image.base64
        gateway.upload(base64Image: base64str, text: text, confidence: 0.7) { [weak self] response in
            switch response {
            case .success(response: _): return //TODO: Notify user
            case let .failure(error: error): self?.errorHandler?.proceed(error: error)
            }
        }
    }
}
