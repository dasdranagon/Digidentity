//
//  NavigatorMock.swift
//  Digidentity
//
//  Created by Denis Skokov on 13/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import UIKit
@testable import Digidentity

class NavigatorMock: Navigator {
    var presentedViewController: UIViewController?
    var navigationMethod: NavigationMethod?
    var presentWasCalled = false
    func present(viewController: UIViewController, navigationMethod: NavigationMethod) {
        self.presentWasCalled = true
        self.presentedViewController = viewController
        self.navigationMethod = navigationMethod
    }
    
    var dusmissWasCalled = false
    func dusmiss() {
        dusmissWasCalled = true
    }
    
    var popWasCalled = false
    func pop() {
        popWasCalled = true
    }
}
