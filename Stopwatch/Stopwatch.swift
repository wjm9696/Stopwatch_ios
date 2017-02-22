//
//  Stopwatch.swift
//  Stopwatch
//
//  Created by Jimmy on 2/16/17.
//  Copyright © 2017 Jimmy. All rights reserved.
//

import Foundation

class Stopwatch{
    var on = false
    var date = Date()
    init() {
        

    }
    
    func start(){
        on = true
        date = Date()

    }
    
    func stop(){
        on = false
        

    }
    
    func getTimeString() -> String{
        var timeString: String
        if(on){
            let timeLapse = -date.timeIntervalSinceNow
            let seconds: Int = Int(timeLapse)
            let mm: Int = Int((timeLapse - Double(seconds)) * 100)
            let minutes: Int = seconds / 60
            let realSeconds = seconds % 60
            timeString = String(format: "%02d:%02d.%02d", minutes, realSeconds, mm)
            
        }else{
            timeString = "00:00.00"
        }
        return timeString

    }
    
    
    

    
    

}
