//
//  ImagePickerPresenter.swift
//  Digidentity
//
//  Created by Denis Skokov on 13/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import UIKit

class ImagePickerPresenter: NSObject {
    enum Contants {
        static let maxSize = CGFloat(512)
    }
    
    weak var wireframe: ImagePickerWireframe!
    weak var imageObserver: ImageObserver!
}
extension ImagePickerPresenter: UINavigationControllerDelegate {}

extension ImagePickerPresenter: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let originalImage = info[.originalImage] as? UIImage else {
            wireframe.close()
            return
        }
        
        let size = originalImage.size
        let scale = min(Contants.maxSize/size.width, Contants.maxSize/size.height)
        
        let smallImageSize = CGSize(width: size.width*scale, height: size.height*scale)
        UIGraphicsBeginImageContext(smallImageSize)
        originalImage.draw(in: CGRect(origin: CGPoint.zero, size: smallImageSize))
        let smallImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if let image = smallImage {
            imageObserver.send(image: image)
        }
        wireframe.close()
    }
}
