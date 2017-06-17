//
//  ViewController.swift
//  iOS-Kicks-Detection-Demo
//
//  Created by WataruSuzuki on 2017/06/19.
//  Copyright © 2017年 WataruSuzuki. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,
    AVCaptureVideoDataOutputSampleBufferDelegate
{
    
    @IBOutlet weak var previewView: UIView!
    private let captureSession = AVCaptureSession()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupCamera()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func checkCaptureDeviceAuthorizationStatus(completionHandler handler: @escaping (Bool) -> Swift.Void) {
        let authorizationStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        switch authorizationStatus {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: {
                (granted:Bool) -> Void in
                if granted {
                    handler(true)
                } else {
                    handler(false)
                }
            })
            
        case .authorized:
            handler(true)
            
        case .denied, .restricted:
            handler(false)
        }
    }
    
    private func setupCamera() {
        let cameraDevices = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: .back)
        for device in cameraDevices.devices {
            if device.position == .back {
                checkCaptureDeviceAuthorizationStatus(completionHandler: { (granted) in
                    if granted {
                        DispatchQueue.main.async {
                            self.setupCameraInputSession(device: device)
                        }
                    }
                })
                break
            }
        }
    }
    
    private func setupCameraInputSession(device: AVCaptureDevice) {
        do {
            let cameraInput = try AVCaptureDeviceInput(device: device)
            if captureSession.canAddInput(cameraInput) {
                captureSession.addInput(cameraInput)
                setupCameraOutputSession()
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    private func setupCameraOutputSession() {
        let videoOutput = AVCaptureVideoDataOutput()
        
        videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "buffer queue", qos: .userInteractive, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil))
        
        if captureSession.canAddOutput(videoOutput) {
            captureSession.addOutput(videoOutput)
        }
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        
        previewLayer.frame = previewView.bounds
        previewView.layer.addSublayer(previewLayer)
        
        captureSession.startRunning()
    }
}

