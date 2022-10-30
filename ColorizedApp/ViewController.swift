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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.layer.cornerRadius = 15
        sliderRed.minimumTrackTintColor = .red
        sliderGreen.minimumTrackTintColor = .green
        sliderBlue.minimumTrackTintColor = .blue
    }
    
// MARK: - IB Action
    
    @IBAction func SliderAction() {
        setupLabel()
        changeColor()
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
}
