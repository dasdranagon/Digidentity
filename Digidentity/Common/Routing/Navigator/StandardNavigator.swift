//
//  StandardNavigator.swift
//  Digidentity
//
//  Created by Denis Skokov on 12/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import UIKit

class StandardNavigator: Navigator {
    private var window: UIWindow!
    private weak var lastPresentedViewController: UIViewController?
    private var rootNavigationController: UINavigationController?
    
    func configure(window: UIWindow) {
        self.window = window
    }
    
    func present(viewController: UIViewController, navigationMethod: NavigationMethod) {
        lastPresentedViewController = viewController
        
        switch navigationMethod {
        case .modalNavigationRoot: presentModalNavigationRoot(viewController: viewController)
        case .modal: presentModal(viewController: viewController)
        case .root: showAsRoot(viewController: viewController)
        case .push: push(viewController: viewController)
        }
    }
    
    func dusmiss() {
        lastPresentedViewController?.dismiss(animated: true)
    }
    
    func pop() {
        rootNavigationController?.popViewController(animated: true)
    }
}

extension StandardNavigator {
    private func presentModalNavigationRoot(viewController: UIViewController) {
        rootNavigationController = UINavigationController(rootViewController: viewController)
        presentModal(viewController: rootNavigationController!)
    }
    
    private func presentModal(viewController: UIViewController) {
        window.rootViewController?.present(viewController, animated: true)
    }
    
    private func showAsRoot(viewController: UIViewController) {
        rootNavigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = rootNavigationController
    }
    
    private func push(viewController: UIViewController) {
        rootNavigationController?.pushViewController(viewController, animated: true)
    }
}
