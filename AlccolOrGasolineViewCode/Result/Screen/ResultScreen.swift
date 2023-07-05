//
//  ResultScreen.swift
//  AlccolOrGasolineViewCode
//
//  Created by Matheus Sousa on 05/07/23.
//

import UIKit

protocol ResultScreenDelegate: AnyObject {
    func tappedBackButton()
    func tappedCalculateAgain()
}

class ResultScreen: UIView {
    
    
    private weak var delegate: ResultScreenDelegate?
    
    public func delegate(delegate: ResultScreenDelegate?){
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
    
    lazy var descriptionBestFuelLabel: UILabel = {
       let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Melhor abastecer com:"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    lazy var resultBestFuelLabel: UILabel = {
       let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 72)
        
        return label
    }()
    
    lazy var calculateAgainButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calcular Novamente", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 230/255, green: 0/255, blue: 127/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedCalculateAgain), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.backgroundImageView)
        self.addSubview(self.backButton)
        self.addSubview(self.logoAppImageView)
        self.addSubview(self.descriptionBestFuelLabel)
        self.addSubview(self.resultBestFuelLabel)
        self.addSubview(self.calculateAgainButton)
        
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedBackButton(){
        self.delegate?.tappedBackButton()
    }
    
    @objc func tappedCalculateAgain(){
        self.delegate?.tappedCalculateAgain()
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            self.backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            self.logoAppImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 144),
            self.logoAppImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.logoAppImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.descriptionBestFuelLabel.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor, constant: 100),
            self.descriptionBestFuelLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.resultBestFuelLabel.topAnchor.constraint(equalTo: self.descriptionBestFuelLabel.bottomAnchor, constant: 12),
            self.resultBestFuelLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.calculateAgainButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -135),
            self.calculateAgainButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.calculateAgainButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.calculateAgainButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
