//
//  ViewController.swift
//  HeadPhoneCheck
//
//  Created by 高井　翔太 on 2016/10/26.
//  Copyright © 2016年 高井　翔太. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func clickCheckButton(_ sender: UIButton) {
        if headPhoneArePlugged() {
            result.text = "イヤホンがささってます"
        } else {
            result.text = "イヤホンはささってません"
        }
    }

    
    private func headPhoneArePlugged() -> Bool {
        let session = AVAudioSession.sharedInstance()
        var plugged = false
        
        let routeDesc: AVAudioSessionRouteDescription = session.currentRoute
        
        for desc:AVAudioSessionPortDescription in routeDesc.outputs {
            let type = desc.portType
            
            if type == AVAudioSessionPortHeadphones {
                plugged = true
            }
        }
        return plugged
        
    }
}

