//
//  Navigator.swift
//  Digidentity
//
//  Created by Denis Skokov on 12/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import UIKit

enum NavigationMethod {
    case modal
    case push
    case modalNavigationRoot
    case root
}

protocol Navigator: AnyObject {
    func present(viewController: UIViewController, navigationMethod: NavigationMethod)
    func dusmiss()
    func pop()
}
