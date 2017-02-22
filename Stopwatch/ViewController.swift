//
//  ViewController.swift
//  Stopwatch
//
//  Created by Jimmy on 2/16/17.
//  Copyright © 2017 Jimmy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var startButton: UIButton!
    var watchController = Stopwatch()
    var pause = false
    var stop = true
    var on = false
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func startTimer(_ sender: UIButton) {
        if(on){
            return;
        }
        else if( pause ){
            resetLabel()
            startButton.setTitle("Start",for: .normal);
            stop = true
            pause = false
            
        }else if(stop){
                        watchController.start()
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self,
                                             selector: #selector(ViewController.updateLabel(_:)),
                                             userInfo: nil,
                                             repeats: true)
            
            stop = false
            on = true
        }
    }
    
    @IBAction func stopTimer(_ sender: UIButton) {
        if(on){
            watchController.stop()
            startButton.setTitle("Reset",for: .normal);
            if let time = timer{
                time.invalidate();
            }
            on = false
            pause = true
        }
        
        
    }
    
    func updateLabel(_ timer:Timer){
        label.text = watchController.getTimeString()
    }
    
    func resetLabel(){
        label.text = "00:00,00"
    }
    
   

}

