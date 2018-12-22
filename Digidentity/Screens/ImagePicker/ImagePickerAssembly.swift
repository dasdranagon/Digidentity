//
//  ImagePickerAssembly.swift
//  Digidentity
//
//  Created by Denis Skokov on 12/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import UIKit

class ImagePickerAssembly: Assembly {
    var wireframe: DefaultImagePickerWireframe!
    var presenter: ImagePickerPresenter!
    weak var imageObserver: ImageObserver!
    
    func configure() {
        let navigator = dependencies.navigator

        wireframe = DefaultImagePickerWireframe(navigator: navigator)
        wireframe.viewControllerFactory = self

        presenter = ImagePickerPresenter()
        presenter.wireframe = wireframe
    }
    
    func injectDependencies() {
        presenter.imageObserver = imageObserver
    }
}

extension ImagePickerAssembly: ViewControllerFactory {
    func createViewController() -> UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = presenter
        imagePicker.sourceType = UIImagePickerController.isSourceTypeAvailable(.camera) ? .camera : .photoLibrary
        return imagePicker
    }
}

