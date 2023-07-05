//
//  CalculateVC.swift
//  AlccolOrGasolineViewCode
//
//  Created by Matheus Sousa on 05/07/23.
//

import UIKit

class CalculateVC: UIViewController {
    
    var screen: CalculateScreen?

    override func loadView() {
        super.loadView()
        self.screen = CalculateScreen()
        self.view = screen
        self.screen?.delegate(delegate: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addGestureTapKeyboardDismiss()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}

extension CalculateVC: CalculateScreenDelegate {
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func tappedCalculateButton(){
        let formatter = NumberFormatter()
        let ethanolPrice = Double(truncating: formatter.number(from: self.screen?.ethanolPriceTextField.text ?? "0") ?? 0.0)
        
        let gasPrice = Double(truncating: formatter.number(from: self.screen?.gasPriceTextFIeld.text ?? "0") ?? 0.0)
        
        var vc: ResultVC?
        
        if ethanolPrice/gasPrice > 0.7 {
            vc = ResultVC(bestFuel: .gas)
        }else {
            vc = ResultVC(bestFuel: .ethanol)
        }
        navigationController?.pushViewController(vc ?? ViewController(), animated: true)
    }
}
