//
//  LoginScreen.swift
//  look
//
//  Created by Nick Hoyt on 4/4/17.
//  Copyright © 2017 IntelliSkye. All rights reserved.
//
import UIKit
import Foundation

class LoginScreen: UIViewController, UITextFieldDelegate { //, FBSDKLoginButtonDelegate {
    //Login text fields on UI
    
    
    //Save login data
    let MyKeyChainWrapper = KeychainWrapper()
    let createLoginButtonTag = 0
    let loginButtonTag = 1
    var tokenNum : String = ""
    //Responses for whether login passed or failed
    var responseString = ""
    var allowed = false
    
    //Email Declaration to store inputted email
    var email : String = ""
    var username = ""
   
    @IBOutlet var usernameField: UITextField!
    
    @IBOutlet var passwordField: UITextField!
   // let loginbutton = FBSDKLoginButton()
    
    //Login Button Declaration
    //@IBOutlet var loginView: LoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //For now lets just keep them logged out if they use Facebook
        //let loginManager = FBSDKLoginManager()
       // loginManager.logOut()
        
        //Setup Facebook login button
        /*
        view.addSubview(loginbutton)
        loginbutton.frame = CGRect(x: 0.0, y: self.view.frame.size.height - 50, width: view.frame.width, height: 50)
        
        //Delegate to self and set read permissions
        loginbutton.delegate = self
        loginbutton.readPermissions = ["email", "public_profile"]
        /*
         if(MusicHelper.sharedHelper.playing){
         MusicHelper.sharedHelper.stopBackgroundMusic()
         }
         */
 
 */
        // Do any additional setup after loading the view, typically from a nib.
        self.usernameField.delegate = self
        self.passwordField.delegate = self
        
        //Set color of text fields to Silver to match text
        let myColor : UIColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1.0)
        usernameField.layer.masksToBounds = true
        passwordField.layer.masksToBounds = true
        usernameField.layer.borderWidth = 1
        passwordField.layer.borderWidth = 1
        usernameField.layer.borderColor = myColor.cgColor
        passwordField.layer.borderColor = myColor.cgColor
    }
    
    //Print result of Facebook button
    /*
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil{
            print(error)
            return
        }
        //Print successful in log in was correct
        print("Successfully logged in with facebook.")
        
        //Graph Request for desired fields
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, first_name, last_name, email, friends"]).start { (connection, result, err) in
            
            if err != nil{
                print("Failed to start graph request:", err)
                return
            }
            
            if result != nil{
                //DATA PARSING HERE
                let data:[String:AnyObject] = result as! [String : AnyObject]
                
                //Stores email, first name, and last name
                self.fbEmail = data["email"] as! String!
                self.fbFirst = data["first_name"] as! String!
                self.fbLast = data["last_name"] as! String!
                self.fbId = data["id"] as! String!
                
                self.checkFacebookDB()
                
                //Check if in Facebook Database
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                    if self.responseString == "True"{
                        self.email = self.fbEmail
                        self.tokenNum = self.getToken()
                        
                        if self.tokenNum != "null"{
                            UserDefaults.standard.setValue(self.fbEmail, forKey: "email")
                            print("Here")
                            
                            UserDefaults.standard.set(true, forKey: "hasLogin")
                            UserDefaults.standard.synchronize()
                            self.performSegue(withIdentifier: "loginSegue", sender: self)
                        }
                    }
                    else{
                        //Segue to register screen if not in Facebook database
                        self.performSegue(withIdentifier: "registerSegue", sender: self)
                    }
                }
            }
            
        }
    }
    
 */
    /*
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did log out of Facebook")
    }
 */
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === usernameField {
            passwordField.becomeFirstResponder()
        }
        else if textField === passwordField{
            passwordField.resignFirstResponder()
        }
        else{
            return false
        }
        
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func postToServerFunction(){
        //Contingency Handling. Error handling etc.
        username = usernameField.text!
        var password : String = passwordField.text!
        var request = URLRequest(url: URL(string: "http://intelliskye.com/LookPhp/Login.php")!)
        
        if !email.canBeConverted(to: String.Encoding.ascii){
            let alert=UIAlertController(title: "Oops!", message: "Bad Character Entered", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil));
            //show it
            self.show(alert, sender: self);
        }
        else{
            request.httpMethod = "POST"
            
            var postString: String!
            postString = "username=\(username)&password=\(password)"
            request.httpBody = postString.data(using: String.Encoding.utf8)
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {                                                 // check for fundamental networking error
                    print("error=\(error)")
                    return
                }
                
                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                    print("statusCode should be 200, but is \(httpStatus.statusCode)")
                    print("response = \(response)")
                }
                
                self.responseString = String(data: data, encoding: .utf8)!
                print("responseString = \(self.responseString)")
                
            }
            checkResponseString()
            task.resume()
        }
    }
    
    
    //Check if is a Facebook user in Database
        
    
    ///////////////////
    
    func checkResponseString(){
        print(allowed)
        if(self.responseString == "Success"){
            allowed = true
        }
        else{
            allowed = false
        }
    }
    
    
    
    ///////////////////
    
    
    @IBAction func loginButt(_ sender: Any) {
        postToServerFunction()
        print("ALLOWED CHECKED")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            if(self.allowed || self.responseString == "Success" || self.responseString == "Resource id #4"){ //put if username = username from db and password = password from db then it does segue.
                print("ALLOWED")
                //Sets email in UserDefault.
                UserDefaults.standard.setValue(self.usernameField.text!, forKey: "username")
                
                
                self.MyKeyChainWrapper.mySetObject(self.passwordField.text, forKey:kSecValueData)
                self.MyKeyChainWrapper.writeToKeychain()
                UserDefaults.standard.set(true, forKey: "hasLogin")
                UserDefaults.standard.synchronize()
                
                self.performSegue(withIdentifier: "loginToMain", sender: self)
            }
            else if self.responseString == "None"{
                let alert=UIAlertController(title: "Oops!", message: "Email or Password is incorrect", preferredStyle: UIAlertControllerStyle.alert);
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil));
                //show it
                self.show(alert, sender: self);
            }
        } //this is the semicolon
        

    }
    
    
    
    
    @IBAction func needToRegisterButt(_ sender: Any) {
        self.performSegue(withIdentifier: "loginToRegister", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginToMain" {
            
            let DestViewController : MainPageScreen = segue.destination as! MainPageScreen
            // doSomething(sender as! UIButton)
            
            
                DestViewController.username = username
            }
            
        
        
        
        //If Facebook login but user does not exist conduct registration page
               }
    }

