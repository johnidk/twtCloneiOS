//
//  File.swift
//  twitterCloned
//
//  Created by João Gabriel Lavareda Ayres Barreto on 17/05/23.
//

import UIKit

class LoginController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    //MARK: - Properties
    
    private let emailTextField: UITextField = {
        let emailField = Extensions().textField(withPlaceholder: "Email")
        return emailField
    }()
    
    private let psswdTextField: UITextField = {
        let pssdField = Extensions().textField(withPlaceholder: "Password")
        return pssdField
    }()
    
    private let signUpTextField: UITextField = {
        let signUpField = UITextField()
        signUpField.text = "Sign Up"
        return signUpField
    }()
    
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.twitterBlue, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(LoginController.self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    private lazy var dontHaveAcc: UIButton = {
        let button = Extensions().signUpOption("Don't have an account?", " Sign Up")
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    private let logoImageView: UIImageView = {
        let iv  = UIImageView()
        iv.contentMode = .scaleAspectFit
        
        iv.clipsToBounds = true
        iv.image = UIImage(imageLiteralResourceName: "TwitterLogo")
        return iv
    }()
    
    private lazy var emailContainerView: UIView = {
        let image = UIImage(systemName: "envelope")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let view = Extensions().inputContainerView(withImage: image!, textField: emailTextField)
        
        return view
    }()
    
    
    private lazy var passwordContainerView: UIView = {
        let image = UIImage(systemName: "lock")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let view = Extensions().inputContainerView(withImage: image!, textField: psswdTextField)
        
        return view
    }()
    //MARK: - Lifecycle

    //MARK: - Selectors
    
    @objc func handleLogin() {
        
    }

    
    @objc func handleShowSignUp() {
        let controller = RegistrationController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    
    //MARK: - Helpers

    func configureUI() {
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(logoImageView)
        logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        logoImageView.setDimensions(width: 150, height: 150)
        
        view.addSubview(emailTextField)

        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 8
        stack.alignment = .fill
        
        view.addSubview(stack)
        stack.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 16, paddingRight: 20)
        
        view.addSubview(dontHaveAcc)
        dontHaveAcc.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 40, paddingRight: 40)
        
    }
}
