//
//  BaseWireframe.swift
//  Digidentity
//
//  Created by Denis Skokov on 12/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Foundation

class BaseWireframe: Wireframe {
    weak var navigator: Navigator!
    weak var viewControllerFactory: ViewControllerFactory!
    
    var navigationMethod: NavigationMethod = .root
    
    init(navigator: Navigator) {
        self.navigator = navigator
    }
    
    func activate() {
        let viewController = viewControllerFactory.createViewController()
        navigator.present(viewController: viewController, navigationMethod: navigationMethod)
    }
    
    func deactivate() {}
}
