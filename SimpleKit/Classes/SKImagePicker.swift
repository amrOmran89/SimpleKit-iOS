//
//  SKImagePicker.swift
//  Pods
//
//  Created by Amr Omran on 12/23/2018.
//

import UIKit


public class SKImagePicker {
    
    private weak var viewController: UIViewController?
    private let imagePickerController: UIImagePickerController

    
    public init(viewController: UIViewController, imagePickerController: UIImagePickerController) {
        self.viewController = viewController
        self.imagePickerController = imagePickerController
    }
    
    
    func openCamera() {
        self.imagePickerController.allowsEditing = false
        self.imagePickerController.sourceType = .camera
        viewController?.present(imagePickerController, animated: true, completion: nil)
    }
    
    func openGallery() {
        self.imagePickerController.allowsEditing = false
        self.imagePickerController.sourceType = .photoLibrary
        viewController?.present(imagePickerController, animated: true, completion: nil)
    }
    
    public func showImagePickerOptions(sender: UIView) {
        let alertController = UIAlertController(title: nil, message: "Choose source of the image", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Open Camera", style: .default, handler: { _ in
//            self.openCamera()
        }))
        alertController.addAction(UIAlertAction(title: "Open Gallery", style: .default, handler: { _ in
            self.openGallery()
        }))
       
        let device = UIDevice.current.userInterfaceIdiom
        
        switch device {
        case .pad:
            if let popoverController = alertController.popoverPresentationController {
                popoverController.sourceView = sender
                popoverController.sourceRect = sender.bounds
            }
        default:
            break
        }
        
        viewController?.present(alertController, animated: true, completion: nil)
    }
    
    deinit {
        print("SKImagePicker is deinitialized")
    }
    
}
