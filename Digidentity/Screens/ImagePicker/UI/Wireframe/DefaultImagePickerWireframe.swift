//
//  DefaultImagePickerWireframe.swift
//  Digidentity
//
//  Created by Denis Skokov on 13/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Foundation

class DefaultImagePickerWireframe: BaseWireframe {
    override init(navigator: Navigator) {
        super.init(navigator: navigator)
        self.navigationMethod = .modal
    }
}

extension DefaultImagePickerWireframe: ImagePickerWireframe {
    func close() {
        navigator.dusmiss()
    }
}
