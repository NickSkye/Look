//
//  ProfileScreen.swift
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

class ProfileScreen: UIViewController {
    
    var username = ""
    var pictureArray = [String]()
    var latLngArray = [String]()
    var dateArray = [String]()
    @IBOutlet var profilePicture: UIImageView!
    @IBOutlet var usernameLbl: UILabel!
    @IBOutlet var currentLatLng: UILabel!
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePicture.image = #imageLiteral(resourceName: "testProfPic")
        usernameLbl.text = "NickSkye"
        currentLatLng.text = "69.69, 69.69"
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return pictureArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ProfileCell
        cell.imageV.image = UIImage(named: "testProfPic")
        cell.latlngLbl.text = String(latLngArray[indexPath.row])
        cell.dateLbl.text = String(dateArray[indexPath.row])
        
        
        // cell.viewButton.tag = indexPath.row
        //  cell.viewButton.addTarget(self, action: Selector("viewAction:"), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "contestscreenSegue", sender: self)
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "mainToCamera" {
            let DestViewController : ViewController = segue.destination as! ViewController
            DestViewController.username = username
        }
        
        
    }
}
