//
//  ViewController.swift
//  AlccolOrGasolineViewCode
//
//  Created by Matheus Sousa on 05/07/23.
//

import UIKit

class HomeVC: UIViewController {
    
    var screen: HomeScreen?

    override func loadView() {
        super.loadView()
        self.screen = HomeScreen()
        self.view = screen
        self.screen?.delegate(delegate: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

}

extension HomeVC: HomeScreenDelegate {
    func tappedStartButton() {
        let vc = CalculateVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
