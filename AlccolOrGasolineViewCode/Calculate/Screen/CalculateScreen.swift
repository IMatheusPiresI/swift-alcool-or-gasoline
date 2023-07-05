//
//  CalculateScreen.swift
//  AlccolOrGasolineViewCode
//
//  Created by Matheus Sousa on 05/07/23.
//

import UIKit

protocol CalculateScreenDelegate: AnyObject {
    func tappedBackButton()
    func tappedCalculateButton()
}

class CalculateScreen: UIView {
    
    
    private weak var delegate: CalculateScreenDelegate?
    
    public func delegate(delegate: CalculateScreenDelegate?){
        self.delegate = delegate
    }
    
    lazy var backgroundImageView: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BG_BLUR")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Botão_Back"), for: .normal)
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "LOGO_MENOR")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var ethanolPriceTextField: UITextField = {
        let tf = UITextField()
        let padding = UIView.init(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 8
        tf.attributedPlaceholder = NSAttributedString(string: "Preço do Álcool")
        tf.textColor = .darkGray
        tf.backgroundColor = .white
        tf.keyboardType = .decimalPad
        
        tf.leftView = padding
        tf.leftViewMode = .always
        tf.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        return tf
    }()
    
    lazy var gasPriceTextFIeld: UITextField = {
        let tf = UITextField()
        let padding = UIView.init(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 8
        tf.attributedPlaceholder = NSAttributedString(string: "Preço do Álcool")
        tf.textColor = .darkGray
        tf.backgroundColor = .white
        tf.keyboardType = .decimalPad
        
        tf.leftView = padding
        tf.leftViewMode = .always
        tf.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        return tf
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton()
        
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calcular", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(tappedCalculateButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.addSubview(self.backgroundImageView)
        self.addSubview(self.backButton)
        self.addSubview(self.logoAppImageView)
        self.addSubview(self.ethanolPriceTextField)
        self.addSubview(self.gasPriceTextFIeld)
        self.addSubview(self.calculateButton)
        
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedBackButton(){
        self.delegate?.tappedBackButton()
    }
    
    @objc func tappedCalculateButton(){
        self.delegate?.tappedCalculateButton()
    }
    
    @objc func textFieldDidChange() {
        self.calculateButton.isEnabled = !self.ethanolPriceTextField.text!.isEmpty && !self.gasPriceTextFIeld.text!.isEmpty
        
        if calculateButton.isEnabled {
            calculateButton.backgroundColor = UIColor(red: 230/255, green: 0/255, blue: 127/255, alpha: 1.0)
        }else {
            calculateButton.backgroundColor = .gray
        }
    }
    
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            self.backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            
            self.logoAppImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 140),
            self.logoAppImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            self.logoAppImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            
            self.ethanolPriceTextField.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor, constant: 104),
            self.ethanolPriceTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.ethanolPriceTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.ethanolPriceTextField.heightAnchor.constraint(equalToConstant: 44),
            
            self.gasPriceTextFIeld.topAnchor.constraint(equalTo: self.ethanolPriceTextField.bottomAnchor, constant: 12),
            self.gasPriceTextFIeld.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.gasPriceTextFIeld.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.gasPriceTextFIeld.heightAnchor.constraint(equalToConstant: 44),
            
            self.calculateButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -135),
            self.calculateButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.calculateButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.calculateButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
}
