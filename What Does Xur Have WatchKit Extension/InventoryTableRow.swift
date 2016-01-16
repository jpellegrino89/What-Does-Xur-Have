//
//  InventoryTableRow.swift
//  What Does Xur Have
//
//  Created by Joseph Pellegrino on 1/16/16.
//  Copyright © 2016 Joseph Pellegrino. All rights reserved.
//

import WatchKit

class ServerTableRowController: NSObject{
    
    @IBOutlet weak var interfaceImage: WKInterfaceImage!
    @IBOutlet weak var interfaceLabel: WKInterfaceLabel!
    @IBOutlet weak var ID: WKInterfaceLabel!
    @IBOutlet weak var serverDiskIO: WKInterfaceLabel!
    @IBOutlet weak var serverMemory: WKInterfaceLabel!
    @IBOutlet weak var serverDisk: WKInterfaceLabel!
    
}