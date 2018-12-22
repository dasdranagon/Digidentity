//
//  AddImagePresenter.swift
//  Digidentity
//
//  Created by Denis Skokov on 13/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import UIKit

class AddImagePresenter {
    var view: AddImageRepresentation!
    var wireframe: AddImageWireframe!
    var interactor: AddImageInteractor!
    
}

extension AddImagePresenter: AddImageIntentObserver {
    func ready() {
        view.show(text: "")
        view.uploadButton(show: false)
    }

    func takePhoto() {
        wireframe.showImagePicker()
    }

    func upload() {
        interactor.upload()
    }
    
    func close() {
        wireframe.close()
    }
}

extension AddImagePresenter: ImageObserver {
    func send(image: UIImage) {
        view.show(image: image)
        interactor.process(image: .ui(image: image))
    }
}

extension AddImagePresenter: AddImageInteractorOutput {
    func recognized(text: String) {
        view.show(text: text)
        view.uploadButton(show: true)
    }
}
