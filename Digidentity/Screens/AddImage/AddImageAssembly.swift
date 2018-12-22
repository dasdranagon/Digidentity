//
//  AddImageAssembly.swift
//  Digidentity
//
//  Created by Denis Skokov on 12/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import UIKit

class AddImageAssembly: Assembly {
    var imagePickerAssembly: ImagePickerAssembly!
    
    var wireframe: DefaultAddImageWireframe!
    var presenter: AddImagePresenter!
    var interactor: DefaultAddImageInteractor!
    
    func configure() {
        let navigator = dependencies.navigator
        let requestManager = dependencies.requestManager
        
        presenter = AddImagePresenter()
        
        let gateway = DefaultAddImageGateway(requestManager: requestManager)
        interactor = DefaultAddImageInteractor(gateway: gateway)
        interactor.outout = presenter
        interactor.textRecognizer = TesseractOCR()
//        interactor.textRecognizer = StubTextRecognizer()
        
        wireframe = DefaultAddImageWireframe(navigator: navigator)
        wireframe.viewControllerFactory = self
        
        presenter.wireframe = wireframe
        presenter.interactor = interactor
    }
    
    func injectDependencies() {
        wireframe.imagePickerWireframe = imagePickerAssembly.wireframe
        imagePickerAssembly.imageObserver = presenter
    }
}

extension AddImageAssembly: ViewControllerFactory {
    func createViewController() -> UIViewController {
        let viewController = initialControllerFromStoryboard() as! AddImageViewController
    
        viewController.intentObserver = presenter
        presenter.view = viewController
        interactor.errorHandler = viewController
        
        return viewController
    }
}

