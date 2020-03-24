//
//  LoginViewController.swift
//  EventProfiler
//
//  Created by Ripan Halder on 4/25/19.
//  Copyright © 2019 Ripan Halder. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.emailTextField.text = ""
        self.passwordTextField.text = ""
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil{
                print(error!)
                self.emailTextField.text = ""
                self.passwordTextField.text = ""
                let alert = UIAlertController(title: "Unsuccessful!", message: "Check Your Credentials Again", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }else{
                print("Login Successful")
                self.performSegue(withIdentifier: "goToMainScreenFromLogin", sender: self)
            }
        }
    }

}
