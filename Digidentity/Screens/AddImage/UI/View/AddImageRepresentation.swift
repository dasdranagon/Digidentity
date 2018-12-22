//
//  AddImageRepresentation.swift
//  Digidentity
//
//  Created by Denis Skokov on 13/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import UIKit

protocol AddImageRepresentation: AnyObject {
    func show(image: UIImage)
    func show(text: String)
    
    func uploadButton(show: Bool)
}
