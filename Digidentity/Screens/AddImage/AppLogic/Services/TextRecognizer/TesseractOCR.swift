//
//  TesseractOCR.swift
//  Digidentity
//
//  Created by Denis Skokov on 12/15/18.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import Foundation
import TesseractOCR

class TesseractOCR {
    private let queue = OperationQueue()
}

extension TesseractOCR: TextRecognizer {
    func recognize(image: Image, completion: @escaping Completion) {
        guard let operation = G8RecognitionOperation(language: "eng+nld"),
              let image = UIImage(image: image) else {
            completion(nil)
            return
        }
        
        operation.tesseract.engineMode = .tesseractOnly
        operation.tesseract.pageSegmentationMode = .autoOnly
        operation.tesseract.image = image
        operation.recognitionCompleteBlock =  { tesseract in
            completion(tesseract?.recognizedText)
        }
     
        queue.addOperation(operation)
    }
}
