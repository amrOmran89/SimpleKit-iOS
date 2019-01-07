//
//  SKScanner.swift
//  SimpleKit
//
//  Created by Amr Omran on 12/29/2018.
//

import Foundation
import AVFoundation

public class SKScanner {
    
    
    public let session = AVCaptureSession()
    public let videoOutput = AVCaptureVideoDataOutput()
    public let metadataOutput = AVCaptureMetadataOutput()
    
    public init() {}

    
    
    public func startLiveVideo(streamView: UIImageView) {
      
        session.sessionPreset = AVCaptureSession.Preset.photo
     
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput = try! AVCaptureDeviceInput(device: videoCaptureDevice)
//        videoOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: Int(kCVPixelFormatType_32BGRA)]

//        videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue.global(qos: DispatchQoS.QoSClass.default))

        
        if session.canAddInput(videoInput) {
            session.addInput(videoInput)
        }
        
//        if session.canAddOutput(videoOutput) {
//            session.addOutput(videoOutput)
//        }
        
        if session.canAddOutput(metadataOutput) {
            session.addOutput(metadataOutput)
            
//            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr]
            
        } else {
            return
        }
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.frame = streamView.bounds
        previewLayer.videoGravity = .resizeAspectFill
        streamView.layer.addSublayer(previewLayer)
        
        session.startRunning()
    }
    
    public func stopLiveVideo() {
        session.stopRunning()
    }
    
    /*
    public func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        session.stopRunning()
        
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else {return}
            guard let stringValue = readableObject.stringValue else { return }
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            found(code: stringValue)
        }
    }
    
    public func found(code: String) {
        print(code)
    }
 */
    
}
