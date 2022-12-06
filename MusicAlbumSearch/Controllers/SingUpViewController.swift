//
//  SingUpViewController.swift
//  MusicAlbumSearch
//
//  Created by Тимур Ахметов on 02.04.2022.
//

import UIKit

class SignUpViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.9770730784, blue: 0.9714993712, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "REGISTRATION"
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "First Name"
        return textField
    }()
    
    private let firstNameValidLabel: UILabel = {
        let label = UILabel()
        label.text = " "
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondNameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Second Name"
        return textField
    }()
    
    private let secondNameValidLabel: UILabel = {
        let label = UILabel()
        label.text = " "
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ageValidLabel: UILabel = {
        let label = UILabel()
        label.text = " "
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Phone"
        textField.text = "+7"
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private let phoneValidLabel: UILabel = {
        let label = UILabel()
        label.text = " "
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "E-mail"
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    private let emailValidLabel: UILabel = {
        let label = UILabel()
        label.text = " "
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.placeholder = "Password"
        return textField
    }()
    
    private let passwordValidLabel: UILabel = {
        let label = UILabel()
        label.text = " "
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.800814867, green: 0.226603955, blue: 0.0949620679, alpha: 1)
        button.setTitle("SAVE", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addShadowOnView()
        return button
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 0.1
        return imageView
    }()
    
    private var elementsStackView = UIStackView()
    private let datePicker = UIDatePicker()
    
    let nameValueType: String.ValueTypes = .name
    let emailValueType: String.ValueTypes = .email
    let passwordlValueType: String.ValueTypes = .password
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        setupDelegate()
        setupDataPicker()
        registerKeyboardNotification()
        addTaps()
    }
    
    deinit {
        removeKeyBoardNotification()
    }
    
    private func setupViews() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(backgroundView)
        scrollView.addSubview(logoImageView)
        
        elementsStackView = UIStackView(arrangedSubviews: [firstNameTextField,
                                                           firstNameValidLabel,
                                                           secondNameTextField,
                                                           secondNameValidLabel,
                                                           datePicker,
                                                           ageValidLabel,
                                                           phoneNumberTextField,
                                                           phoneValidLabel,
                                                           emailTextField,
                                                           emailValidLabel,
                                                           passwordTextField,
                                                           passwordValidLabel],
                                        axis: .vertical,
                                        spacing: 10,
                                        distribution: .equalSpacing)
        
        backgroundView.addSubview(elementsStackView)
        backgroundView.addSubview(loginLabel)
        backgroundView.addSubview(signUpButton)
    }
    
    private func setupDelegate() {
        firstNameTextField.delegate = self
        secondNameTextField.delegate = self
        phoneNumberTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func setupDataPicker() {
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = .white
        datePicker.layer.borderColor = #colorLiteral(red: 0.8810099265, green: 0.8810099265, blue: 0.8810099265, alpha: 1)
        datePicker.layer.borderWidth = 1
        datePicker.clipsToBounds = true
        datePicker.layer.cornerRadius = 6
        datePicker.tintColor = .black
    }
    
    @objc private func signUpButtonTapped() {
        
        let firstNameText = firstNameTextField.text ?? ""
        let secondNameText = secondNameTextField.text ?? ""
        let emailText = emailTextField.text ?? ""
        let passwordText = passwordTextField.text ?? ""
        let phoneText = phoneNumberTextField.text ?? ""
        
        if firstNameText.isValid(validType: nameValueType)
            && secondNameText.isValid(validType: nameValueType)
            && emailText.isValid(validType: emailValueType)
            && passwordText.isValid(validType: passwordlValueType)
            && phoneText.count == 18
            && ageIsValid() == true {
            
            DataBase.shared.saveUser(firstName: firstNameText, secondName: secondNameText, phone: phoneText, email: emailText, password: passwordText, age: datePicker.date)
            loginLabel.text = "REGISTRATION COMPLITE"
            loginLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        } else {
            loginLabel.text = "REGISTRATION"
            loginLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
            alertOk(title: "Error", message: "Fill in all fields and your age must be 18+ y.o.")
        }
    }
    
    private func setTextField(textField: UITextField, label: UILabel, validType: String.ValueTypes, validMessage: String, wrongMessage: String, string: String, range: NSRange) {
        
        let text = (textField.text ?? "") + string
        let result: String
        
        if range.length == 1 {
            let end = text.index(text.startIndex, offsetBy: text.count - 1)
            result = String(text[text.startIndex..<end])
        } else {
            result = text
        }
        
        textField.text = result
        
        if result.isValid(validType: validType) {
            label.text = validMessage
            label.textColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        } else {
            label.text = wrongMessage
            label.textColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        }
    }
    
    private func setPhoneNumberMask(textField: UITextField, mask: String, string: String, range: NSRange) -> String {
        
        let text = textField.text ?? ""
        
        let phone = (text as NSString).replacingCharacters(in: range, with: string)
        let number = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = number.startIndex
        
        for character in mask where index < number.endIndex {
            if character == "X" {
                result.append(number[index])
                index = number.index(after: index)
            } else {
                result.append(character)
            }
        }
        
        if result.count == 18 {
            phoneValidLabel.text = "Phone is valid"
            phoneValidLabel.textColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        } else {
            phoneValidLabel.text = "Phone is not valid"
            phoneValidLabel.textColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        }
        return result
    }
    
    private func ageIsValid() -> Bool {
        let calendar = NSCalendar.current
        let dateNow = Date()
        let birthday = datePicker.date
        
        let age = calendar.dateComponents([.year], from: birthday, to: dateNow)
        let ageYear = age.year
        guard let ageUser = ageYear else { return false }
        return (ageUser < 18 ? false : true)
    }
    
    private func addTaps() {
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(tapScreen)
        
        let swipeScreen = UISwipeGestureRecognizer(target: self, action: #selector(swipeHideKeyboard))
        swipeScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(swipeScreen)
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func swipeHideKeyboard() {
        view.endEditing(true)
    }
}

//MARK: - UITextFieldDelegate

extension SignUpViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        switch textField {
        case firstNameTextField: setTextField(textField: firstNameTextField,
                                              label: firstNameValidLabel,
                                              validType: nameValueType,
                                              validMessage: "Name is valid",
                                              wrongMessage: "Only 'A-Z' characters, min. 1 character",
                                              string: string,
                                              range: range)
        case secondNameTextField: setTextField(textField: secondNameTextField,
                                               label: secondNameValidLabel,
                                               validType: nameValueType,
                                               validMessage: "Name is valid",
                                               wrongMessage: "Only 'A-Z' characters, min. 1 character",
                                               string: string,
                                               range: range)
        case emailTextField: setTextField(textField: emailTextField,
                                          label: emailValidLabel,
                                          validType: emailValueType,
                                          validMessage: "Email is valid",
                                          wrongMessage: "Email is not valid",
                                          string: string,
                                          range: range)
        case passwordTextField: setTextField(textField: passwordTextField,
                                             label: passwordValidLabel,
                                             validType: passwordlValueType,
                                             validMessage: "Password is valid",
                                             wrongMessage: "Password is not valid",
                                             string: string,
                                             range: range)
        case phoneNumberTextField: phoneNumberTextField.text = setPhoneNumberMask(textField: phoneNumberTextField,
                                                                                  mask: "+X (XXX) XXX-XX-XX",
                                                                                  string: string,
                                                                                  range: range)
        default:
            break
        }
        
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        firstNameTextField.resignFirstResponder()
        secondNameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
}

//MARK: - registerKeyboardNotification (show/hide keyboard)

extension SignUpViewController {
    
    private func registerKeyboardNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    private func removeKeyBoardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        let userInfo = notification.userInfo
        let keyboardHeight = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentOffset = CGPoint(x: 0, y: keyboardHeight.height / 2)
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        scrollView.contentOffset = CGPoint.zero
    }
}

//MARK: - SetConstraints

extension SignUpViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            backgroundView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            backgroundView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            backgroundView.heightAnchor.constraint(equalTo: view.heightAnchor),
            backgroundView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            elementsStackView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            elementsStackView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            elementsStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            elementsStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            loginLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            loginLabel.bottomAnchor.constraint(equalTo: elementsStackView.topAnchor, constant: -15),
        ])
        
        NSLayoutConstraint.activate([
            signUpButton.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: elementsStackView.bottomAnchor, constant: -15),
            signUpButton.heightAnchor.constraint(equalToConstant: 40),
            signUpButton.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            logoImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.9),
            logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
        ])
    }
}

