//
//  Factory.swift
//  SlotMachine
//
//  Created by Andy on 11/01/2015.
//  Copyright (c) 2015 Andy Stannard. All rights reserved.
//

import Foundation
import UIKit

class Factory{
    class func createSlots() -> [[Slot]]{
        
        let kNumberOfSlots = 3
        let kNumberOfContainers = 3
        var slots: [[Slot]] = []
        
        for var containerNumber = 0; containerNumber < kNumberOfContainers; ++containerNumber{
            var slotArray:[Slot] = []
            for var slotNumber = 0; slotNumber < kNumberOfSlots; ++slotNumber{
                var slot = Slot(value: 0, image: UIImage(named: ""), isRed: true)
                slotArray.append(slot)
            }
            slots.append(slotArray)
        }
        return slots
    }
    

}