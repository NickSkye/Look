//
//  RegisterScreen.swift
//  look
//
//  Created by Nick Hoyt on 4/4/17.
//  Copyright © 2017 IntelliSkye. All rights reserved.
//
import UIKit
import Foundation


class RegisterScreen: UIViewController, UITextFieldDelegate {
    
    //UI Variables
    @IBOutlet var username: UITextField!
    @IBOutlet var first: UITextField!
    @IBOutlet var last: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var confirmPasswordField: UITextField!
    @IBOutlet var emailField: UITextField!
    
    @IBOutlet var scroller: UIScrollView!
    @IBOutlet var scrollText: UIView!
    
    @IBOutlet var checkBoxOut: UIButton!
    
    //Response variables
    var responseString = ""
    var fbResponseString = ""
    var allowed = false
    var accepted = false
    var overEighteen = false
    
    //Passed in variables
    var email : String = ""
    var userName = ""
    var tokenNum = ""
    
    //Facebook Variables
    var fbFirst : String = ""
    var fbLast : String = ""
    var fbId : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // scrollText.isHidden = true
        
        //Set TextBox colors and size
        let myColor : UIColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1.0)
        first.layer.masksToBounds = true
        last.layer.masksToBounds = true
        emailField.layer.masksToBounds = true
        passwordField.layer.masksToBounds = true
        confirmPasswordField.layer.masksToBounds = true
        username.layer.masksToBounds = true
        
        first.layer.borderWidth = 1
        last.layer.borderWidth = 1
        username.layer.borderWidth = 1
        emailField.layer.borderWidth = 1
        passwordField.layer.borderWidth = 1
        confirmPasswordField.layer.borderWidth = 1
        
        first.layer.borderColor = myColor.cgColor
        last.layer.borderColor = myColor.cgColor
        emailField.layer.borderColor = myColor.cgColor
        username.layer.borderColor = myColor.cgColor
        passwordField.layer.borderColor = myColor.cgColor
        confirmPasswordField.layer.borderColor = myColor.cgColor
        //End Set Textbox Colors and Size
        
        //Declaring buttons with self
        self.first.delegate = self
        self.last.delegate = self
        self.passwordField.delegate = self
        self.username.delegate = self
        self.confirmPasswordField.delegate = self
        self.emailField.delegate = self
        //End Button Declaration with self
        
        if(self.fbId != ""){
            //Set Text from Facebook
            first.text = self.fbFirst
            last.text = self.fbLast
            emailField.text = self.email
            
            //Disable text from being editted
            first.isUserInteractionEnabled = false
            last.isUserInteractionEnabled = false
            emailField.isUserInteractionEnabled = false
        }
    }
    
    
    @IBAction func checkBoxClicked(_ sender: Any) {
        overEighteen = !overEighteen
        if overEighteen == false {
            checkBoxOut.setImage(UIImage(named: "whiteSquare.png"), for: UIControlState.normal)
        }
        else {
            checkBoxOut.setImage(UIImage(named: "redX.jpeg"), for: UIControlState.normal)
        }
    }
    
    
    
    func viewTC(action: UIAlertAction) {
        
        self.performSegue(withIdentifier: "registerToTerms", sender: self)
        //UIApplication.shared.openURL(URL(string: "https://www.celebritiessquared.com/termsandconditions")!)
        //scroller.contentSize = CGSize(width: 400, height: 2300)
        //scrollText.isHidden = false
        /*
         let testView: UIView = UIScrollView(frame: CGRect(x: 50, y: 100, width: (self.view.frame.width-100), height: self.view.frame.height/2))
         testView.center = CGPoint(x: self.view.frame.size.width  / 2
         , y: self.view.frame.size.height / 2)
         let label = UILabel(frame: CGRect(x: 0, y: 0, width: testView.frame.size.width, height: testView.frame.size.width))
         
         label.textAlignment = .left
         label.text = "hjjkndfkjnsdjknfjksdjkfnkjnsdknfknsdjknfj sdjkfjknsdjknfjknsjkdnfjknsjdknfjknjksdnjkfnjksdnfjknsjdknfjknsjdnfnsdjnfjksdknfknsjkdnfkjnsdkjnfkjndskjjkfnkjsdnjkfnjkdsnfkjsdnjkfnjkdnjkfnjkdnkjfnkdskjfnkjdsnkjfnsdnfkjnsdkjnfkjsndkjfnkjsdnkjfnskjdnjfjksndkfjsdkjnfkjnsdjkfnjksnjkfnsjkdnfjksnjkdnjkfdnkjfnjkdfnksdfnkjndjkfnsjfnjkdnjkfndkjnfkjsdnfjkndskjnfkjsndjkfndskjnfksdnkjfnjkdsnkfnjkdsnfkjnsjkdfksnfjksdnfkjsnjkfnjksndjkfnjskdnfjsdnjkfnkjsdnfkjsdnjfknsdjknfjksnjdkfnjksnfdjknjkndfsjknkfnsdjkfnjksdnfknsdjkfnsdkjfnkjneknekjnfjknsjknfjknsdkjnfjknsdfkjnsdkjfbjkdsbfjksdkf"
         label.numberOfLines = 2000
         
         
         testView.backgroundColor = .white
         testView.alpha = 1.0
         testView.tag = 100
         testView.isUserInteractionEnabled = true
         //testView.accessibilityScroll(.vertical)
         label.center = CGPoint(x: testView.frame.size.width  / 2
         , y: testView.frame.size.height / 2)
         testView.addSubview(label)
         self.view.addSubview(testView)
         /*
         let alertt=UIAlertController(title: "Terms and Conditions", message: "-I have read and accepted the User Agreement and Privacy Policy.\n\n-I am at least 18 years old.", preferredStyle: UIAlertControllerStyle.alert);
         alertt.addAction(UIAlertAction(title: "Terms & Conditions", style: UIAlertActionStyle.default, handler: viewTC));
         alertt.addAction(UIAlertAction(title: "Accept", style: UIAlertActionStyle.default, handler: acceptButt));
         alertt.addAction(UIAlertAction(title: "Deny", style: UIAlertActionStyle.cancel, handler: denyButt));
         //show it
         self.show(alertt, sender: self);
         */
         
         */
    }
    
    func acceptButt(action: UIAlertAction) {
        print("accepted")
        accepted = true
    }
    
    func denyButt(action: UIAlertAction) {
        print("denied")
        let alert=UIAlertController(title: "Are You Sure", message: "Clicking 'Deny' will stop you from being able to play the game.", preferredStyle: UIAlertControllerStyle.alert);
        alert.addAction(UIAlertAction(title: "Terms & Conditions", style: UIAlertActionStyle.default, handler: viewTC));
        alert.addAction(UIAlertAction(title: "Accept", style: UIAlertActionStyle.default, handler: acceptButt));
        alert.addAction(UIAlertAction(title: "Deny", style: UIAlertActionStyle.cancel, handler: denyCertain));
        //show it
        self.show(alert, sender: self);
    }
    
    func denyCertain(action: UIAlertAction) {
        print("denied")
        accepted = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === first{
            last.becomeFirstResponder()
        }
        else if textField === last{
            username.becomeFirstResponder()
        }
        else if textField === username{
            emailField.becomeFirstResponder()
        }
        else if textField === emailField{
            passwordField.becomeFirstResponder()
        }
        else if textField === passwordField{
            confirmPasswordField.becomeFirstResponder()
        }
        else if textField === confirmPasswordField{
            confirmPasswordField.resignFirstResponder()
        }
        else{
            return false
        }
        
        return true
    }
    
    
    func postToServerFunction(){
        //Contingency Handling. Error handling etc.
        var firstName : String = first.text!
        var lastName : String = last.text!
        var password : String = passwordField.text!
        var confirmPassword : String = confirmPasswordField.text!
        email = emailField.text!
        userName = username.text!
        
        if !email.canBeConverted(to: String.Encoding.ascii){
            let alert=UIAlertController(title: "Oops!", message: "Bad Character Entered", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil));
            //show it
            self.show(alert, sender: self);
        }
        else{
            
            if(password == confirmPassword){
                var request = URLRequest(url: URL(string: "http://dev.celebritiessquared.com/CSPhp/Register.php")!)
                
                request.httpMethod = "POST"
                
                var postString: String!
                postString = "first=\(firstName)&last=\(lastName)&email=\(email)&username=\(userName)&password=\(password)"
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
                task.resume()
            }else{
                print("Passwords not equal")
                return
            }
            
        }
    }
    
    func postToFacebookServer(){
        
        var request = URLRequest(url: URL(string: "http://dev.celebritiessquared.com/CSPhp/CreateFacebookUser.php")!)
        
        request.httpMethod = "POST"
        
        var postString: String!
        self.fbResponseString = ""
        
        print(fbId)
        
        postString = "fbId=\(fbId)&email=\(email)"
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
            
            self.fbResponseString = String(data: data, encoding: .utf8)!
            print("fbResponseString = \(self.fbResponseString)")
        }
        task.resume()
    }
    
    
    //////////////////////////////////////
    func emailFunction(){
        //Contingency Handling. Error handling etc.
        
        var password : String = passwordField.text!
        email = emailField.text!
        
        
        var request = URLRequest(url: URL(string: "http://dev.celebritiessquared.com/CSPhp/SendEmail.php")!)
        
        request.httpMethod = "POST"
        
        var postString: String!
        postString = "email=\(email)&password=\(password)"
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
        
        task.resume()
    }
    
    
    //////////////////////////////////
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func checkResponseString(){
        print(allowed)
        if(responseString == "Success"){
            allowed = true
        }
        else{
            allowed = false
        }
    }
    
    
    @IBAction func registerButton(_ sender: Any) {
        //change segue to programattically seque if registration passes
        if accepted && overEighteen{
            postToServerFunction()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                print(self.responseString)
                if self.responseString == "Success" { //put if username = username from db and password = password from db then it does segue.
                    print(self.email)
                    //EmailClass.sharedHelper.sendEmail(email: self.email, password: self.passwordField.text!)
                    self.emailFunction()
                    
                    if self.fbId != ""{
                        self.postToFacebookServer()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                            if(self.fbResponseString == "Success"){
                                self.performSegue(withIdentifier: "howtoplaySegue", sender: self)
                            }else{
                                let alert=UIAlertController(title: "Oops!", message: "Failed to complete registration. Please try again", preferredStyle: UIAlertControllerStyle.alert);
                                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil));
                                //show it
                                self.show(alert, sender: self);
                            }
                        }
                    }else{
                        self.performSegue(withIdentifier: "howtoplaySegue", sender: self)
                    }
                }
                
            }
        }
        else{
            
            if self.accepted == false{
                let alertt=UIAlertController(title: "Terms and Conditions", message: "-I have read and accepted the User Agreement and Privacy Policy.", preferredStyle: UIAlertControllerStyle.alert);
                alertt.addAction(UIAlertAction(title: "Terms & Conditions", style: UIAlertActionStyle.default, handler: viewTC));
                alertt.addAction(UIAlertAction(title: "Accept", style: UIAlertActionStyle.default, handler: acceptButt));
                alertt.addAction(UIAlertAction(title: "Deny", style: UIAlertActionStyle.cancel, handler: denyButt));
                //show it
                self.show(alertt, sender: self);
            }
            else if self.overEighteen == false {
                let alert=UIAlertController(title: "Oops!", message: "Please Verify That You Are Over 18 Years Of Age.", preferredStyle: UIAlertControllerStyle.alert);
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil));
                //show it
                self.show(alert, sender: self);
            }
            
            
        }    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        
        let alert=UIAlertController(title: "Terms and Conditions", message: "-I have read and accepted the User Agreement and Privacy Policy.", preferredStyle: UIAlertControllerStyle.alert);
        alert.addAction(UIAlertAction(title: "Terms & Conditions", style: UIAlertActionStyle.default, handler: viewTC));
        alert.addAction(UIAlertAction(title: "Accept", style: UIAlertActionStyle.default, handler: acceptButt));
        alert.addAction(UIAlertAction(title: "Deny", style: UIAlertActionStyle.cancel, handler: denyButt));
        //show it
        self.show(alert, sender: self);
        
        if(self.fbId != ""){
            let alert=UIAlertController(title: "Continue with Facebook", message: "You are almost ready! The email, first and last name fields have been populated by the data recieved from your Facebook account. Please fill in your desired username and password to complete the registration process! You will be able to sign in normally and through Facebook once this process is complete.",preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
            //show it
            self.show(alert, sender: self)
        }
        
    }
    
    //Change to segue to How to Play
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "howtoplaySegue" {
            let DestViewController : HowToPlayScreen = segue.destination as! HowToPlayScreen
            // doSomething(sender as! UIButton)
            
            DestViewController.email = email
            DestViewController.tokenNum = tokenNum
        }
    }
}
