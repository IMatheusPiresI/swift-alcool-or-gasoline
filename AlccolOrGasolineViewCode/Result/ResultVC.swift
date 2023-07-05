//
//  ResultVC.swift
//  AlccolOrGasolineViewCode
//
//  Created by Matheus Sousa on 05/07/23.
//

import UIKit

enum BestFuel: String {
    case gas = "Gasolina"
    case ethanol = "Álcool"
}
class ResultVC: UIViewController {

    var screen: ResultScreen?
    var bestFuel: BestFuel?
    
    init(bestFuel: BestFuel){
        self.bestFuel = bestFuel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.screen = ResultScreen()
        self.view = screen
        self.screen?.delegate(delegate: self)
        self.screen?.resultBestFuelLabel.text = self.bestFuel?.rawValue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func goBack(){
        navigationController?.popViewController(animated: true)
    }
}

extension ResultVC: ResultScreenDelegate {
    func tappedBackButton() {
        goBack()
    }
    
    func tappedCalculateAgain() {
        goBack()
    }
    
    
}
