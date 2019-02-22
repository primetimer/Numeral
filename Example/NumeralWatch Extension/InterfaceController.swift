//
//  InterfaceController.swift
//  NumeralWatch Extension
//
//  Created by Stephan Jancar on 22.02.19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import WatchKit
import Foundation
import BigInt
import Numeral

class InterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let x = BigUInt(100000)
        let x3 = x * x * x
        let greek = x3.Greek()
        print(greek)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
