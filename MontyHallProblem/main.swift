//
//  main.swift
//  MontyHallProblem
//
//  Created by Adnan Zahid on 12/27/16.
//  Copyright © 2016 Adnan Zahid. All rights reserved.
//

import Foundation

func openDoorIfNotChosen(chosen: UInt32, car: UInt32) -> UInt32 {
    
    let toBeOpened = arc4random_uniform(3)
    
    if toBeOpened == chosen || toBeOpened == car {
        
        return openDoorIfNotChosen(chosen: chosen, car: car)
        
    } else {
        
        return toBeOpened
    }
}

func montyHallProblemSuccess() -> Bool {
    
    let car = arc4random_uniform(3)
    
    let chosen = arc4random_uniform(3)
    
    let opened = openDoorIfNotChosen(chosen: chosen, car: car)
    
    var notChosen: UInt32 = 0
    
    for i: UInt32 in 0 ... 2 {
        
        if i != chosen && i != opened {
            
            notChosen = i
        }
    }
    
    return notChosen == car
}

var success = 0

var maxTrials = 1000000

for i in 0 ... maxTrials {
    
    if montyHallProblemSuccess() == true {
        
        success = success + 1
    }
}

print(success)
