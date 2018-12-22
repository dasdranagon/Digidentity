//
//  ViewControllerFactory.swift
//  Digidentity
//
//  Created by Denis Skokov on 12/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import UIKit

protocol ViewControllerFactory: AnyObject {
    var storyboardName: String { get }
    var bundle: Bundle { get }
    
    func initialControllerFromStoryboard() -> UIViewController
    func createViewController() -> UIViewController
}

extension ViewControllerFactory {
    var bundle: Bundle {
        return Bundle(for: type(of: self))
    }
    
    private func storyboard() -> UIStoryboard {
        return UIStoryboard(name: storyboardName, bundle: bundle)
    }
    
    func initialControllerFromStoryboard() -> UIViewController {
        let storyboard = self.storyboard()
        return storyboard.instantiateInitialViewController()!
    }
}
