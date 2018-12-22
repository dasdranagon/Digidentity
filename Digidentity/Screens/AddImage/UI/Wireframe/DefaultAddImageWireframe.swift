//
//  DefaultAddImageWireframe.swift
//  Digidentity
//
//  Created by Denis Skokov on 13/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Foundation

class DefaultAddImageWireframe: BaseWireframe {
    var imagePickerWireframe: Wireframe!
    
    override init(navigator: Navigator) {
        super.init(navigator: navigator)
        self.navigationMethod = .push
    }
}

extension DefaultAddImageWireframe: AddImageWireframe {
    func close() {
        navigator.pop()
    }
    
    func showImagePicker() {
        imagePickerWireframe.activate()
    }
}
