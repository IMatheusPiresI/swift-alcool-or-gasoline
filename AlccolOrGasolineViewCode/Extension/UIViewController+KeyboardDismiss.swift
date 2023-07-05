//
//  UIViewControllerExtension.swift
//  AlccolOrGasolineViewCode
//
//  Created by Matheus Sousa on 05/07/23.
//

import UIKit

extension UIViewController {
    func addGestureTapKeyboardDismiss(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(keyboardDismiss))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func keyboardDismiss(){
        self.view.endEditing(true)
    }
}
