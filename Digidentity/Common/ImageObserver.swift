//
//  ImageObserver.swift
//  Digidentity
//
//  Created by Denis Skokov on 12/15/18.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import UIKit

protocol ImageObserver: AnyObject {
    func send(image: UIImage)
}
