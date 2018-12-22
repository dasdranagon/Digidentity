//
//  AddImageInteractor.swift
//  Digidentity
//
//  Created by Denis Skokov on 12/15/18.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

protocol AddImageInteractor: AnyObject {
    func process(image: Image)
    func upload()
}

protocol AddImageInteractorOutput: AnyObject {
    func recognized(text: String)
}
