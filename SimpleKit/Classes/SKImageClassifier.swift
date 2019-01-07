//
//  File.swift
//  SimpleKit
//
//  Created by Amr Omran on 01/05/2019.
//

import UIKit
import CoreML
import Vision

public class SKImageClassifier {
    
    func classifyThisImage(image: UIImage, callback: @escaping (Result?, Error?) -> Void) {
        // 1) create model instance from the trained model
        guard let model = try? VNCoreMLModel(for: MobileNet().model) else { return }
        
        // 2) create request
        let request = VNCoreMLRequest(model: model) { (req, error) in
            
            if error == nil {
                let result = req.results as! [VNClassificationObservation]
                DispatchQueue.main.async {
                    let identifier = result.first?.identifier
                    let confidence = result.first?.confidence
                    callback(Result(identifier: identifier ?? "", confidence: confidence ?? 0.0), nil)
                }
            } else {
                callback(nil, SKError.coreMLError)
            }
        }
        
        // 3) create handler for the request
        let orientation = CGImagePropertyOrientation(orientation: image.imageOrientation)
        guard let ciImage = CIImage(image: image) else { return }
        let handler = VNImageRequestHandler(ciImage: ciImage, orientation: orientation, options: [:])
        
        do {
            try handler.perform([request])
        } catch let error {
            print(error)
            callback(nil, error)
        }
    }
    
}



struct Result {
    var identifier: String
    var confidence: Float
    
    init(identifier: String, confidence: Float) {
        self.identifier = identifier
        self.confidence = confidence
    }
}


extension CGImagePropertyOrientation {
    
    init(orientation: UIImage.Orientation) {
        
        switch orientation {
        case .up:
            self = .up
        case .upMirrored:
            self = .upMirrored
        case .down:
            self = .down
        case .downMirrored:
            self = .downMirrored
        case .left:
            self = .left
        case .leftMirrored:
            self = .leftMirrored
        case .right:
            self = .right
        case .rightMirrored:
            self = .rightMirrored
        }
    }
    
}
