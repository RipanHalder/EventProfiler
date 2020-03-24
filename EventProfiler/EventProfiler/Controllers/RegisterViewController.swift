//
//  RegisterViewController.swift
//  EventProfiler
//
//  Created by Ripan Halder on 4/25/19.
//  Copyright © 2019 Ripan Halder. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        emailTextField.text = ""
        passwordTextField.text = ""
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func registerPressed(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil{
                print(error!)
//                self.emailTextField.text = ""
                self.passwordTextField.text = ""
                let alert = UIAlertController(title: "Invalid!", message: "Password Should be of minimum 6 characters and Email ID must be valid", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }else{
                print("Registeration Successful!")
                self.performSegue(withIdentifier: "goToCreateProfile", sender: self)
            }
        }
    }
}
