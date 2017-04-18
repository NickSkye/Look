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

class ProfileScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var username = ""
    var pictureArray = [String]()
    var latArray = [String]()
    var lngArray = [String]()
    var dateArray = [String]()
    var selectedPic = ""
    var selectedPicLat = ""
    var selectedPicLng = ""
    var selectedPicDate = ""
    @IBOutlet var profilePicture: UIImageView!
    @IBOutlet var usernameLbl: UILabel!
    @IBOutlet var currentLatLng: UILabel!
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TEST
        profilePicture.image = #imageLiteral(resourceName: "testProfPic")
        usernameLbl.text = "NickSkye"
        currentLatLng.text = "69.69, 69.69"
        pictureArray.append("https://images-na.ssl-images-amazon.com/images/M/MV5BMTk0ODI2NTEzMl5BMl5BanBnXkFtZTcwNDY5MjI3NA@@._V1_UY317_CR17,0,214,317_AL_.jpg")
        latArray.append("69.69")
        lngArray.append("69.69")
        dateArray.append("69/69/69")
        ///////////
        tableView.reloadData()
    }
    
    
    func downloadJsonWithURL(){
        //let url = NSURL(string: urlString)
        
        var request = URLRequest(url: URL(string: "www.intelliskye.com/LookPhp/Profiles.php")!)
        
        request.httpMethod = "POST"
        
        var postString: String!
        postString = "username=\(username)"
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error) ->
            Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                as? NSDictionary{
                print(jsonObj!)
                
                if let contestArray = jsonObj!.value(forKey: "profile") as? NSArray{
                    
                    for contest in contestArray{
                        if let contestDict = contest as? NSDictionary{
                            
                            if let name = contestDict.value(forKey: "pictures"){
                                self.pictureArray.append((name as? String)!)
                                
                               // print(self.first)
                            }
                            
                          
                        
                            
                            
                        }
                        OperationQueue.main.addOperation ({
                          
                        })
                    }
                }
            }
        }).resume()
    }
    

    
    
    @IBAction func backButton(_ sender: Any) {
        self.performSegue(withIdentifier: "profileToMain", sender: self)
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        print(pictureArray.count)
        return pictureArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ProfileCell
        
        let imgURL = NSURL(string: pictureArray[indexPath.row])
        
        if imgURL != nil{
            let data = NSData(contentsOf: (imgURL as? URL)!)
            cell.imageV!.image = UIImage(data: data as! Data)
        }
       
        selectedPic = pictureArray[indexPath.row]
        cell.latlngLbl.text = String(latArray[indexPath.row])
        selectedPicLat = latArray[indexPath.row]
        selectedPicLng = lngArray[indexPath.row]
        cell.dateLbl.text = String(dateArray[indexPath.row])
        selectedPicDate = dateArray[indexPath.row]
        
        
        // cell.viewButton.tag = indexPath.row
        //  cell.viewButton.addTarget(self, action: Selector("viewAction:"), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "profileToPicture", sender: self)
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "mainToCamera" {
            let DestViewController : ViewController = segue.destination as! ViewController
            DestViewController.username = username
        }
        if segue.identifier == "profileToPicture" {
            let DestViewController : PictureViewScreen = segue.destination as! PictureViewScreen
            DestViewController.username = username
            DestViewController.selectedPic = selectedPic
            DestViewController.selectedPicLat = selectedPicLat
            DestViewController.selectedPicLng = selectedPicLng
            DestViewController.selectedPicDate = selectedPicDate
        }
        
        
    }
}
