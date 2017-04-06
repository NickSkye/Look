//
//  MainPageScreen.swift
//  look
//
//  Created by Nick Hoyt on 4/6/17.
//  Copyright © 2017 IntelliSkye. All rights reserved.
//

import Foundation

import UIKit
import AVFoundation
import AVKit
import SwiftyCam

class MainPageScreen: UIViewController {
    
    var username = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func cameraButton(_ sender: Any) {
        self.performSegue(withIdentifier: "mainToCamera", sender: self)
    }
    @IBAction func profileButton(_ sender: Any) {
        self.performSegue(withIdentifier: "mainToProfile", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "mainToCamera" {
            let DestViewController : ViewController = segue.destination as! ViewController
            DestViewController.username = username
        }

    
    }
}
