//
//  Extensions.swift
//  twitterCloned
//
//  Created by João Gabriel Lavareda Ayres Barreto on 17/05/23.
//

import UIKit

class Extensions {
    
    func inputContainerView(withImage image: UIImage, textField: UITextField) -> UIView {
        let view = UIView()
        let iv = UIImageView()
        
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        iv.image = image
        view.addSubview(iv)
        iv.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, paddingLeft: 8, paddingBottom: 8)
        iv.setDimensions(width: 24, height: 24)
        
        view.addSubview(textField)
        textField.anchor(left: iv.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, paddingBottom: 8)

        let dividerView = UIView()
        dividerView.backgroundColor = .white
        view.addSubview(dividerView)
        
        dividerView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, height: 0.75)

        return view
    }
    
    func textField(withPlaceholder text: String) -> UITextField {
        let txt = UITextField()
        txt.textColor = .white
        txt.tintColor = .darkGray
        txt.attributedPlaceholder = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return txt
    }
    
    func signUpOption(_ firstPart:String, _ secondPart:String) -> UIButton {
        let button = UIButton(type: .system)
        
        let attrTitle = NSMutableAttributedString(string: firstPart, attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor.white])
        
        attrTitle.append(NSAttributedString(string: secondPart, attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor.darkGray]))
        
        button.setAttributedTitle(attrTitle, for: .normal)
        
        return button
    }
    
}
