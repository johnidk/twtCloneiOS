//
//  RegistrationController.swift
//  twitterCloned
//
//  Created by João Gabriel Lavareda Ayres Barreto on 17/05/23.
//

import UIKit
import Firebase

class RegistrationController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    //MARK: - Properties
    
    private let imagePicker = UIImagePickerController()
    
    
    //MARK: - Fields
    private let emailTextField: UITextField = {
        let emailField = Extensions().textField(withPlaceholder: "Email")
        return emailField
    }()
    
    private let psswdTextField: UITextField = {
        let emailField = Extensions().textField(withPlaceholder: "Password")
        return emailField
    }()
    
    private let fullNameTextField: UITextField = {
        let emailField = Extensions().textField(withPlaceholder: "Full Name")
        return emailField
    }()
    
    private let usernameTextField: UITextField = {
        let emailField = Extensions().textField(withPlaceholder: "Username")
        return emailField
    }()
    
    private lazy var alreadyHaveAccBtn: UIButton = {
        let button = Extensions().signUpOption("Already have an account?", " Log In")
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        return button
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.twitterBlue, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleRegistration), for: .touchUpInside)
        return button
    }()
  
    
    //MARK: - Containers Views
    private lazy var addPhotoIcon: UIButton = {
        let icon = UIButton(type: .system)
        icon.setImage(UIImage(named: "plus_photo"), for: .normal)
        icon.tintColor = .white
        icon.addTarget(self, action: #selector(handleAddPhoto), for: .touchUpInside)
        
        return icon
    }()
    
    private lazy var emailContainerView: UIView = {
        let image = UIImage(systemName: "envelope")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let view = Extensions().inputContainerView(withImage: image!, textField: emailTextField)
        
        return view
    }()
    
    private lazy var psswdContainerView: UIView = {
        let image = UIImage(systemName: "envelope")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let view = Extensions().inputContainerView(withImage: image!, textField: psswdTextField)
        
        return view
    }()
    
    private lazy var fullNameContainerView: UIView = {
        let image = UIImage(systemName: "envelope")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let view = Extensions().inputContainerView(withImage: image!, textField: fullNameTextField)
        
        return view
    }()
    
    private lazy var usernameContainerView: UIView = {
        let image = UIImage(systemName: "envelope")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let view = Extensions().inputContainerView(withImage: image!, textField: usernameTextField)
        
        return view
    }()
    
    //MARK: - Lifecycle

    //MARK: - Selectors
    
    @objc func handleRegistration() {
        guard let email = emailTextField.text else { return }
        guard let password = psswdTextField.text else { return }
        

        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("Debug: Error is \(error.localizedDescription)")
            }
        }
    }
    
    @objc func handleShowLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleAddPhoto() {
        present(imagePicker, animated: true, completion: nil)
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .twitterBlue
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        view.addSubview(addPhotoIcon)
        addPhotoIcon.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        addPhotoIcon.setDimensions(width: 150, height: 150)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, psswdContainerView, fullNameContainerView, usernameContainerView, signUpButton])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 8
        stack.alignment = .fill
        
        view.addSubview(stack)
        stack.anchor(top: addPhotoIcon.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 16, paddingRight: 20)
        
        view.addSubview(alreadyHaveAccBtn)
        alreadyHaveAccBtn.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 40, paddingRight: 40)
    }

    
}


extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let profileImg = info[.editedImage] as? UIImage else {return}
        
        addPhotoIcon.layer.cornerRadius = 150 / 2
        addPhotoIcon.layer.masksToBounds = true
        addPhotoIcon.imageView?.contentMode = .scaleAspectFill
        addPhotoIcon.imageView?.clipsToBounds = true
        addPhotoIcon.layer.borderColor = UIColor.white.cgColor
        addPhotoIcon.layer.borderWidth = 3
        
        self.addPhotoIcon.setImage(profileImg.withRenderingMode(.alwaysOriginal), for: .normal)
        dismiss(animated: true, completion: nil)
    }
}
