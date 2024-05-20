//
//  SignUpViewController.swift
//  Netflix Project
//
//  Created by 권대윤 on 5/16/24.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var nickNameTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var recommendationCodeTextField: UITextField!
    
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var switchButton: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        designTextFieldUI()
        designButtonUI()
    }
    
    func designTextFieldUI () {
        configureTextField(with: emailTextField, placeholderText: "이메일 주소 또는 전화번호", keyboardType: .emailAddress, isSecureTextEntry: false)
        configureTextField(with: passwordTextField, placeholderText: "비밀번호", keyboardType: .default, isSecureTextEntry: true)
        configureTextField(with: nickNameTextField, placeholderText: "닉네임", keyboardType: .default, isSecureTextEntry: false)
        configureTextField(with: locationTextField, placeholderText: "위치", keyboardType: .default, isSecureTextEntry: false)
        configureTextField(with: recommendationCodeTextField, placeholderText: "추천 코드 입력", keyboardType: .default, isSecureTextEntry: false)
    }
    
    func configureTextField(with textField: UITextField, placeholderText: String, keyboardType: UIKeyboardType, isSecureTextEntry: Bool) {
        textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [.foregroundColor: UIColor.systemGray4])
        textField.textColor = .white
        textField.keyboardType = keyboardType
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .darkGray
        textField.isSecureTextEntry = isSecureTextEntry
    }
    
    func designButtonUI () {
        signUpButton.setAttributedTitle(NSAttributedString(string: "회원가입", attributes: [.font: UIFont.boldSystemFont(ofSize: 16)]), for: .normal)
        signUpButton.titleLabel?.font = .boldSystemFont(ofSize: 14)
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.backgroundColor = .white
        signUpButton.layer.cornerRadius = 5
        
        switchButton.setOn(false, animated: true)
        switchButton.onTintColor = .systemRed
        switchButton.thumbTintColor = .white
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        self.view.endEditing(true)
        
        guard let email = emailTextField.text, email != "" else {
            print("이메일이 유효하지 않아 가입 거부 되었습니다.")
            return
        }
        
        guard let password = passwordTextField.text, password.count > 5 else {
            print("비밀번호가 유효하지 않아 가입 거부 되었습니다.")
            return
        }
        
        guard let nickName = nickNameTextField.text, nickName != "" else {
            print("닉네임이 유효하지 않아 가입 거부 되었습니다.")
            return
        }
        
        guard let location = locationTextField.text, location != "" else {
            print("위치 정보가 유효하지 않아 가입 거부 되었습니다.")
            return
        }
        
        guard let recommendationCode = recommendationCodeTextField.text, recommendationCode != "", Int(recommendationCode) != nil else {
            print("추천 코드가 유효하지 않아 가입 거부 되었습니다.")
            return
        }
        
        print("회원가입성공")
    }
}
