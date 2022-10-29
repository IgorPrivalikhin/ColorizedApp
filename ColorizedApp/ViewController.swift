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
    
    @IBOutlet var labelRed: UILabel!
    @IBOutlet var labelGreen: UILabel!
    @IBOutlet var labelBlue: UILabel!
    
    @IBOutlet var valueRedLabel: UILabel!
    @IBOutlet var valueGreenLabel: UILabel!
    @IBOutlet var valueBlueLabel: UILabel!
    
    @IBOutlet var sliderRed: UISlider!
    @IBOutlet var sliderGreen: UISlider!
    @IBOutlet var sliderBlue: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.layer.cornerRadius = 15
        sliderRed.minimumTrackTintColor = .red
        sliderGreen.minimumTrackTintColor = .green
        sliderBlue.minimumTrackTintColor = .blue
        
        setupLabel()
    }
    
// MARK: - IB Action
    
    @IBAction func SliderAction() {
        changeColor()
        valueRedLabel.text = rounding(number: sliderRed.value)
        valueGreenLabel.text = rounding(number: sliderGreen.value)
        valueBlueLabel.text = rounding(number: sliderBlue.value)
    }
     
// MARK: - Function
    
    func setupLabel() {
        valueRedLabel.text = sliderRed.value.formatted()
        valueGreenLabel.text = sliderGreen.value.formatted()
        valueBlueLabel.text = sliderBlue.value.formatted()
    }
    
    private func changeColor() {
        mainView.backgroundColor = UIColor(red: CGFloat(sliderRed.value), green: CGFloat(sliderGreen.value), blue: CGFloat(sliderBlue.value), alpha: 1)
    }
    
}

// MARK: - Extension

extension ViewController {
    func rounding(number: Float) -> String{
        let roundingValue = Float(round(100 * number) / 100).formatted()
        return roundingValue
    }
}
