//
//  ViewController.swift
//  task_11
//
//  Created by katia kutsi on 4/29/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var fname: UITextField!
    
    @IBOutlet weak var lname: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var gender: UIPickerView!
    
    var genderArray = [Gender]()
    
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpGender()
    }
    
    @IBAction func goToList(_ sender: UIBarButtonItem) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let TableVc   = storyboard.instantiateViewController(withIdentifier: "list")
        
        self.navigationController?.show(TableVc, sender: true)
    }
    
    
    @IBAction func registration(_ sender: UIButton) {
        let inputFname: String? = fname.text!
        let inputLname: String? = lname.text!
        let inputEmail: String? = email.text!

        let user = User(userFname : inputFname!, userLname: inputLname!, userEmail: inputEmail!)
        users.append(user)
    }

    func setUpGender(){
        let male = Gender(genderDef:"male")
        let female = Gender(genderDef:"female")
        
        genderArray.append(male)
        genderArray.append(female)
    }
}

class Gender{
    var genderDef : String
    
    init(genderDef :String){
        self.genderDef = genderDef
    }
}

class User{
    var userFname : String
    var userLname : String
    var userEmail : String
    
    init(userFname : String, userLname : String, userEmail : String){
        self.userFname = userFname
        self.userLname = userLname
        self.userEmail = userEmail
    }
}

extension ViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genderArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let gender = genderArray[row]
        
        return gender.genderDef
    }
    
}
