//
//  ListAssembly.swift
//  Digidentity
//
//  Created by Denis Skokov on 12/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import UIKit

class ListAssembly: Assembly {
    var addImageAssembly: AddImageAssembly!
    
    var wireframe: DefaultListWireframe!
    var presenter: ListPresenter!
    var interactor: DefaultListInteractor!
    
    func configure() {
        let navigator = dependencies.navigator
        let storage = dependencies.storage
        let requestManager = dependencies.requestManager
            
        presenter = ListPresenter()
        
        let gateway = DefaultListGateway(requestManager: requestManager)
        interactor = DefaultListInteractor(gateway: gateway)
        
        interactor.output = presenter
        interactor.storage = storage
        
        wireframe = DefaultListWireframe(navigator: navigator)
        wireframe.viewControllerFactory = self
        
        presenter.interactor = interactor
        presenter.wireframe = wireframe
    }
    
    func injectDependencies() {
        wireframe.addImageWireframe = addImageAssembly.wireframe
    }
}

extension ListAssembly: ViewControllerFactory {
    func createViewController() -> UIViewController {
        let viewController = initialControllerFromStoryboard() as! ListTableViewController
        
        viewController.intentObserver = presenter
        presenter.view = viewController
        interactor.errorHandler = viewController
        
        return viewController
    }
}
