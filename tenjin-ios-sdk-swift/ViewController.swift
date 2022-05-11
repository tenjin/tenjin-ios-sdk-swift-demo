//
//  ViewController.swift
//  tenjin-ios-sdk-swift
//
//  Created by Van Pham on 4/29/18.
//  Copyright © 2018 Tenjin. All rights reserved.
//

import UIKit
import AppTrackingTransparency
import AdSupport

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // In
        TenjinSDK.getInstance("YWZKFWDZEREQCFMF3DST3AYHZPCC9MWV")
        TenjinSDK.appendAppSubversion(6789)
        if #available(iOS 14, *) {
            // Displaying an ATT permission prompt
            ATTrackingManager.requestTrackingAuthorization { (status) in
                switch status {
                case .authorized:
                    print("Authorized")
                    print("Granted consent")
                    // Tenjin initialization with ATTrackingManager
                    TenjinSDK.connect()
                case .denied:
                    print("Denied")
                    print("Denied consent")
                case .notDetermined:
                    print("Not Determined")
                    print("Unknown consent")
                case .restricted:
                    print("Restricted")
                    print("Device has an MDM solution applied")
                @unknown default:
                    print("Unknown")
                
                }
            }
        } else {
            TenjinSDK.connect()
        }
    }
}

