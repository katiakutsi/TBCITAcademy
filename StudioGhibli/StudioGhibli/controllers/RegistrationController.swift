//
//  RegistrationController.swift
//  StudioGhibli
//
//  Created by katia kutsi on 5/26/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import TextFieldEffects
import Kingfisher

class RegistrationController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var newUsername: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var imv: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    let backgroundUrl = URL(string: "https://i.pinimg.com/564x/f8/e5/a9/f8e5a9e66068ba99b7473bca0c2ddd92.jpg")
    let profPicUrl = URL(string: "https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(try! FileManager.default.url(for: .documentationDirectory, in: .allDomainsMask, appropriateFor: nil, create: false))
        
        imv.kf.setImage(with: backgroundUrl)
        profilePicture.kf.setImage(with: profPicUrl)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onImageViewTapped))
        profilePicture.isUserInteractionEnabled = true
        profilePicture.addGestureRecognizer(tapGesture)
    }

    @IBAction func signUpButton(_ sender: UIButton) {
        save()
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func onImageViewTapped() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage{
            self.profilePicture.image = image
        }
        self.dismiss(animated: true)
    }
    
    func save(){
        let context = AppDelegate.coreDataContainer.viewContext
        let user = User(context: context)
        user.firstName = firstName.text
        user.lastName = lastName.text
        user.username = newUsername.text
        user.email = email.text
        user.password = newPassword.text
        if let binaryImage = profilePicture.image?.pngData() {
            user.profilePicture = binaryImage
        }
        do{
            try context.save()
        }catch {}
    }
}
