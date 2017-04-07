//
//  PictureViewScreen.swift
//  look
//
//  Created by Nick Hoyt on 4/4/17.
//  Copyright © 2017 IntelliSkye. All rights reserved.
//

import Foundation

import UIKit
import AVFoundation
import AVKit
import SwiftyCam

class PictureViewScreen: UIViewController {
    
    
    @IBOutlet var pictureImage: UIImageView!
    
    var selectedPic = ""
    var username = ""
    var selectedPicLat = ""
    var selectedPicLng = ""
    var selectedPicDate = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imgURL = NSURL(string: selectedPic)
        
        if imgURL != nil{
            let data = NSData(contentsOf: (imgURL as? URL)!)
            pictureImage!.image = UIImage(data: data as! Data)
        }
      //use selected pic url pictureImage.image = UIImage(data: <#T##Data#>)
        
        
    }
    @IBAction func backButton(_ sender: Any) {
        self.performSegue(withIdentifier: "pictureToProfile", sender: self)
    }
}
