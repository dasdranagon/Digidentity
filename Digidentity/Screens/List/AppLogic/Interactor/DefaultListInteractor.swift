//
//  DefaultListInteractor.swift
//  Digidentity
//
//  Created by Denis Skokov on 14/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Foundation

class DefaultListInteractor {
    let gateway: ListGateway!
    weak var storage: Storage!
    weak var output: ListInteractorOutput!
    weak var errorHandler: ErrorHandler?
    
    private var oldestItemId: String?
    
    init(gateway: ListGateway) {
        self.gateway = gateway
    }
}

extension DefaultListInteractor: ListInteractor {
    
    func setup() {
        storage.fetch { [weak self] items in
            guard let self = self,
                !self.updatedFromNetwork,
                items.count > 0 else { return }
            
            self.updateOutput(items: items)
        }
        
        requestForNewestItems()
    }
    
    
    func fetchNewest() {
        requestForNewestItems()
    }
    
    func fetchNextPage() {
        guard let oldestItemId = oldestItemId else { return }
        
        gateway.fetch(sinceId: nil, maxId: oldestItemId) { [weak self] response in
            switch response {
            case let .success(response: items):
                self?.appendOutput(items: items)
                
            case let .failure(error: error):
                self?.proceed(error: error)
            }
        }
    }
}

extension DefaultListInteractor {
    func requestForNewestItems() {
        gateway.fetch(sinceId: nil, maxId: nil) {  [weak self] response in
            switch response {
            case let .success(response: items):
                self?.updateOutput(items: items)
                self?.storage.update(items: items)
                
            case let .failure(error: error):
                self?.proceed(error: error)
            }
        }
    }
    
    private func updateOutput(items: [ListItem]) {
        oldestItemId = items.last?.id
        output.update(items: items)
    }
    
    private func appendOutput(items: [ListItem]) {
        oldestItemId = items.last?.id
        output.append(items: items)
    }
    
    private func proceed(error: Error) {
        errorHandler?.proceed(error: error)
        output.fail()
    }
}

extension DefaultListInteractor {
    var updatedFromNetwork: Bool {
        return oldestItemId != nil
    }
}
