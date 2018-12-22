//
//  DefaultStorage.swift
//  Digidentity
//
//  Created by Denis Skokov on 14/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Foundation
import FMDB

class DefaultStorage: Storage {
    private enum Constants {
        static let dbkey = "k5d19vvdhhjsgf9jj38^^%mx8G8qV"
    }
    
    private let queue = DispatchQueue(label: "storage.access.queue")
    private var storage: FMDatabase!
    
    func setup() {
        guard let path = storagePath() else {
            debugPrint("cannot get a storage file path")
            return
        }
        
        debugPrint("storage: \(path)")
        storage = FMDatabase(path: path)
        storage.open()
        storage.setKey(Constants.dbkey)
        storage.logsErrors = true
        storage.traceExecution = false
        
        createStorageIfNeeded()
    }
    
    deinit {
        storage.close()
    }
    
    func fetch(completion: @escaping ([ListItem])->()) {
        queue.async { [weak self] in
            var buff: [ListItem] = []
            do {
                let result = try self?.storage.executeQuery("SELECT * FROM Items", values: nil)
                while result?.next() ?? false {
                    guard let id = result?.string(forColumn: "id"),
                        let base64Image = result?.string(forColumn: "image"),
                        let text = result?.string(forColumn: "text"),
                        let confidence = result?.double(forColumn: "confidence") else {
                            continue
                    }
                    
                    let image = Image.base64(string: base64Image)
                    let item = ListItem(id: id, image: image, text: text, confidence: confidence)
                    buff.append(item)
                }
            } catch {
                debugPrint("error: \(error)")
            }
            
            DispatchQueue.main.async {
                completion(buff)
            }
        }
    }
    
    func update(items:[ListItem]) {
        clearStorage()
        queue.async { [weak self] in
            do {
                for item in items {
                    try self?.storage.executeUpdate("INSERT INTO Items VALUES ( ?, ?, ?, ?)",
                                                    values: [item.id, item.image.base64, item.text, item.confidence])
                }
            } catch {
                debugPrint("error: \(error)")
            }
        }
    }
}

extension DefaultStorage {
    private func storagePath() -> String? {
        guard let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                                      .userDomainMask,
                                                                      true).last else {
                                                                        return nil
        }
        return documentsPath + "/storage.sqlite"
    }
    
    private func createStorageIfNeeded() {
        queue.async { [weak self] in
            self?.storage.executeStatements("CREATE TABLE IF NOT EXISTS Items (id TEXT PRIMARY KEY, image TEXT, text TEXT, confidence REAL )")
        }
    }
    
    private func clearStorage() {
        queue.async { [weak self] in
            self?.storage.executeStatements("DROP TABLE Items")
        }
        createStorageIfNeeded()
    }
}
