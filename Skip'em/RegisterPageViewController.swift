//
//  RegisterPageViewController.swift
//  Skip'em
//
//  Created by Daval Cato on 1/28/18.
//  Copyright © 2018 Daval Cato. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var ReenterPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func RegisterButtonTapped(_ sender: Any) {
        
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text
        let userReenterPassword = ReenterPasswordTextField.text
        
        // Check for empty fields
        if((userEmail?.isEmpty)! || (userPassword?.isEmpty)! ||
            (userReenterPassword?.isEmpty)!)
        {
            //Display alert message
            displayMyAlertMessage(userMessage: "All fields are required")
            return;
        }
        
        //Check if passwords match
        if(userPassword != userReenterPassword)
        {
            // Display an alert message
            displayMyAlertMessage(userMessage: "Passwords do not match")
            return;
        }
        
        // Store data
        UserDefaults.standard.set(userEmail, forKey:"userEmail")
        UserDefaults.standard.set(userPassword, forKey:"userPassword")
        UserDefaults.standard.synchronize()
        
        // Display an alert message with comfirmation.
        let myAlert = UIAlertController(title:"Alert", message:"Registration is successful. Thank you!", preferredStyle:UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title:"Ok", style: UIAlertActionStyle.default) {
            action in
            self.dismiss(animated: true, completion: nil)
        
    }
        myAlert.addAction(okAction);
        self.present(myAlert, animated: true, completion: nil);
}
    
    func displayMyAlertMessage(userMessage:String) {
        
        let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title:"Ok", style: UIAlertActionStyle.default, handler:nil);
            self.dismiss(animated: true, completion:nil)
      
        myAlert.addAction(okAction);
        
        self.present(myAlert, animated: true, completion: nil);
    }

}


    



