//
//  ViewController.swift
//  Parking Space Booking System
//
//  Created by Tasneem Bohra on 2018-11-01.
//  Copyright © 2018 Lambton. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var rememberMeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefault = UserDefaults.standard
        if userDefault.string(forKey: "userName") != nil {
            userNameTextField.text = userDefault.string(forKey: "userName")
            passwordTextField.text = userDefault.string(forKey: "password")
            goToMainScreen()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    @IBAction func login(_ sender: UIButton) {
        if userNameTextField.text == "admin" && passwordTextField.text == "1234" {
            let userDefault = UserDefaults.standard
            if rememberMeSwitch.isOn {
                userDefault.set(userNameTextField.text, forKey: "userName")
                userDefault.set(passwordTextField.text, forKey: "password")
            } else {
                userDefault.removeObject(forKey: "userName")
                userDefault.removeObject(forKey: "password")
            }
            goToMainScreen()
        } else {
            let alert = UIAlertController(title: "Unsuccesfull login", message: "Invalid login/password\nTry once again", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func signUp(_ sender: Any) {
    }
    
    private func goToMainScreen() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = sb.instantiateViewController(withIdentifier: "mainVC")
        navigationController?.pushViewController(mainVC, animated: true)
    }
    
}

