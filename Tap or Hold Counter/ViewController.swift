//
//  ViewController.swift
//  Tap or Hold Counter
//
//  Created by Nano Degree on 28/12/2016.
//  Copyright © 2016 Swift Pakistan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    
    var timer: Timer?

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    func buttonTap(sender: UIGestureRecognizer){
        count += 1
        label.text = String(count)
    }
    
    func buttonPress(sender: UIGestureRecognizer){
        if sender.state == .ended{
            print("UIGestureRecoginizer State Ended")
            timer?.invalidate()
        }
        else if sender.state == .began {
            print("UIGesture State Begin")
            timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(ViewController.buttonTap), userInfo: nil, repeats: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "0"
        
        let gestureTap = UITapGestureRecognizer(target:self , action:#selector(ViewController.buttonTap))
        let gesturePress = UILongPressGestureRecognizer(target:self , action:#selector(ViewController.buttonPress))
        
        
        button.addGestureRecognizer(gestureTap)
        button.addGestureRecognizer(gesturePress)
        // Do any additional setup after loading the view, typically from a nib.
    }


}

