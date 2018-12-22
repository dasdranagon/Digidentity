//
//  Assembly
//  Digidentity
//
//  Created by Denis Skokov on 12/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Foundation

protocol Assembly {
    func configure()
    func injectDependencies()
    
    var dependencies: CommonDependencies { get }
}

extension Assembly {
    func injectDependencies() {}
    
    var dependencies: CommonDependencies {
        return CommonDependencies.shared
    }
}

extension Assembly where Self: ViewControllerFactory {
    var storyboardName: String {
        let fullClassName = String(describing: self)
        let className = fullClassName.split(separator: ".").last!
        let screenName = className.replacingOccurrences(of: "Assembly", with: "")
        
        return screenName
    }
}

