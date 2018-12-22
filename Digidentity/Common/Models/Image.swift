//
//  Image.swift
//  Digidentity
//
//  Created by Denis Skokov on 14/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import UIKit

enum Image {
    case base64(string: String)
    case ui(image: UIImage)
}

extension Image {
    var base64: String {
        switch self {
        case let .base64(string): return string
            
        case let .ui(image):
            let data = image.jpegData(compressionQuality: 1.0)!
            return data.base64EncodedString()
        }
    }
    
    var uiImage: UIImage? {
        switch self {
            case let .base64(string):
                guard let data = Data(base64Encoded: string) else { return nil }
                return UIImage(data: data)
            
            case let .ui(image):
                return image
        }
    }
}

extension Image: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let base64String = try container.decode(String.self)
        self = .base64(string: base64String)
    }
}

extension UIImage {
    convenience init?(image: Image) {
        switch image {
        case let .base64(string):
            guard let data = Data(base64Encoded: string) else { return nil }
            self.init(data: data)
            
        case let .ui(image):
            guard let cgImage = image.cgImage else { return nil }
            self.init(cgImage: cgImage)
        }
    }
}
