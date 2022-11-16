//
//  StartViewController.swift
//  ColorizedApp
//
//  Created by Анастасия Булдакова on 15.11.2022.
//

import UIKit

protocol ViewControllerDelegate {
 func changeColor(mainView: UIColor)
 }

class StartViewController: UIViewController {

 var colorSV: UIColor = .black

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = colorSV
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let newColor = segue.destination as? ViewController else { return }
        newColor.mainViewColor = view.backgroundColor
        newColor.delegate = self
    }
    
}

// MARK: - ViewControllerDelegate

extension StartViewController: ViewControllerDelegate {
   func changeColor(mainView: UIColor) {
       view.backgroundColor = mainView
   }
}



