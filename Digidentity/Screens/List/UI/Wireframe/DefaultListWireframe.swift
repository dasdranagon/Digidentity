//
//  DefaultListWireframe.swift
//  Digidentity
//
//  Created by Denis Skokov on 13/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Foundation

class DefaultListWireframe: BaseWireframe {
    var addImageWireframe: Wireframe!
}

extension DefaultListWireframe: ListWireframe {
    func addNewImage() {
        addImageWireframe.activate()
    }
}
