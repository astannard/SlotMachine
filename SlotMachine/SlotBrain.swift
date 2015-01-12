//
//  SlotBrain.swift
//  SlotMachine
//
//  Created by Andy on 12/01/2015.
//  Copyright (c) 2015 Andy Stannard. All rights reserved.
//

import Foundation

class SlotBrain {
    
    
    class func unpackSlotsIntoSlotRows(slots: [[Slot]]) -> [[Slot]]{
        var slotRow1: [Slot] = []
        var slotRow2: [Slot] = []
        var slotRow3: [Slot] = []
        
        for slotArray in slots {
            for var index = 0; index < slotArray.count; index++ {
                let slot = slotArray[index]
                if index == 0 {
                    slotRow1.append(slot)
                }
                else if index == 1{
                    slotRow2.append(slot)
                }
                else if index == 2{
                    slotRow3.append(slot)
                }
                else{
                    print("error")
                }
            }
        }
        var slotsInRows: [[Slot]] = [slotRow1, slotRow2, slotRow3]
        return slotsInRows
    }
    
    class func computeWinnigs(slots: [[Slot]]) -> Int{
        var slotsInRows = unpackSlotsIntoSlotRows(slots)
        var winnings = 0
        
        var flushWinCount = 0
        var threeOfAKindWinCount = 0
        var stringhtWinCount = 0
        
        for slotRow in slotsInRows{
            if checkFlush(slotRow) == true{
                println("flush")
                winnings += 1
                flushWinCount += 1
            }
            
            if checkThreeInARow(slotRow){
                println("3 in a row")
                winnings += 1
                stringhtWinCount += 1
            }
            
            if checkThreeOfAKind(slotRow){
                println("Three of a kind")
                winnings += 1
                threeOfAKindWinCount += 1
            }
        }
        
        
        if flushWinCount == 3{
            println("royal flush")
            winnings += 15
        }
        
        if stringhtWinCount == 3{
            println("Epic streak")
            winnings += 1000
        }
        if threeOfAKindWinCount == 3{
            println("3 3")
            winnings += 50
        }
        return winnings
    }
    
    
    class func checkFlush(slotsrow: [Slot]) -> Bool{
        
        var slot1 = slotsrow[0]
        var slot2 = slotsrow[1]
        var slot3 = slotsrow[2]
        
        if slot1.isRed && slot2.isRed && slot3.isRed{
            return true
        }
        else if !slot1.isRed && !slot2.isRed && !slot3.isRed{
            return true
        }
        else{
            return false
        }
    }
    
    class func checkThreeInARow (slotRow: [Slot]) -> Bool {
        
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.value == slot2.value - 1 && slot1.value == slot3.value - 2 {
            return true
        }
        else if slot1.value == slot2.value + 1 && slot1.value == slot3.value + 2 {
            return true
        }
        else{
            return false
        }
        
    }
    
    class func checkThreeOfAKind( slotRow: [Slot]) -> Bool{
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.value == slot2.value && slot1.value == slot3.value{
            return true
        }
        else{
            return false
        }
    }
}