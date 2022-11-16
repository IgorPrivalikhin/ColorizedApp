//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Анастасия Булдакова on 28.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet var valueRedLabel: UILabel!
    @IBOutlet var valueGreenLabel: UILabel!
    @IBOutlet var valueBlueLabel: UILabel!
    
    @IBOutlet var sliderRed: UISlider!
    @IBOutlet var sliderGreen: UISlider!
    @IBOutlet var sliderBlue: UISlider!
    
    var mainViewColor: UIColor!
    var delegate: ViewControllerDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backgroundColor = mainViewColor
        mainView.layer.cornerRadius = 15
        sliderRed.minimumTrackTintColor = .red
        sliderGreen.minimumTrackTintColor = .green
        sliderBlue.minimumTrackTintColor = .blue
        changeLabelsColor()
    }
    
    // MARK: - IB Action
    
    @IBAction func SliderAction() {
        changeColor()
        setupLabel()
    }
    
    @IBAction func doneButton() {
        delegate.changeColor(mainView: mainView.backgroundColor ?? .blue)
        dismiss(animated: true)
    }

    // MARK: - Function
    
    func setupLabel() {
        valueRedLabel.text = String(format: "%.2f", sliderRed.value)
        valueGreenLabel.text = String(format: "%.2f", sliderGreen.value)
        valueBlueLabel.text = String(format: "%.2f", sliderBlue.value)
    }
    private func changeColor() {
        mainView.backgroundColor = UIColor(red: CGFloat(sliderRed.value), green: CGFloat(sliderGreen.value), blue: CGFloat(sliderBlue.value), alpha: 1)
    }
    
    private func  changeLabelsColor() {
            if mainView.backgroundColor == mainViewColor {
                let ciColor = CIColor(color: mainViewColor ?? .black)
                sliderRed.value = Float(ciColor.red)
                sliderGreen.value = Float(ciColor.green)
                sliderBlue.value = Float(ciColor.blue)
            }
        SliderAction()
        }
   
}
   


