//
//  TitleScreen.swift
//  look
//
//  Created by Nick Hoyt on 4/10/17.
//  Copyright © 2017 IntelliSkye. All rights reserved.
//

import UIKit
import Foundation

class TitleScreen: UIViewController {
    
    var emailPassed: String!
    var hasLoginKey: Bool!
    
    var userName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: "timeToMoveOn", userInfo: nil, repeats: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func timeToMoveOn(){
        hasLoginKey = false
        hasLoginKey = UserDefaults.standard.bool(forKey: "hasLogin")
        print(hasLoginKey)
        
        if hasLoginKey! == false{
            self.performSegue(withIdentifier: "titleScreenSegue", sender: self)
        }
        else if hasLoginKey! == true{
            emailPassed = UserDefaults.standard.string(forKey: "email")
            self.performSegue(withIdentifier: "startScreenSegue", sender: self)
            
        }
    }

}
    
