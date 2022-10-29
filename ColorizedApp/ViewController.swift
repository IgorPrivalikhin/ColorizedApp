//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Анастасия Булдакова on 28.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
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
        mainView.layer.cornerRadius = 15
        sliderRed.minimumTrackTintColor = .red
        sliderGreen.minimumTrackTintColor = .green
        sliderBlue.minimumTrackTintColor = .blue
        super.viewDidLoad()
        setupLabel()
    }
    
    
    @IBAction func redSliderAction() {
        changeColor()
        valueRedLabel.text = rounding(a: sliderRed.value)
    }
    
    @IBAction func greenSliderAction() {
        changeColor()
        valueGreenLabel.text = rounding(a: sliderGreen.value)
    }
    
    @IBAction func blueSliderAction() {
        changeColor()
        valueBlueLabel.text = rounding(a: sliderBlue.value)
    }
    
    func setupLabel() {
        valueRedLabel.text = sliderRed.value.formatted()
        valueGreenLabel.text = sliderGreen.value.formatted()
        valueBlueLabel.text = sliderBlue.value.formatted()
    }
    
    func changeColor() {
        mainView.backgroundColor = UIColor(red: CGFloat(sliderRed.value), green: CGFloat(sliderGreen.value), blue: CGFloat(sliderBlue.value), alpha: 1)
    }
    
}




extension ViewController {
    func rounding(a: Float) -> String{
        let roundingValue = Float(round(100 * a) / 100).formatted()
        return roundingValue
    }
}


/*
 Рабочий вариант:
 @IBAction func redSliderAction() {
     changeColor()
    let ae = abc(a: sliderRed.value)
    brightnessRed.text = ae.formatted()
 }
 
 @IBAction func greenSliderAction() {
     changeColor()
     let ae = abc(a: sliderGreen.value)
     brightnessGreen.text = ae.formatted()
 }
 
 @IBAction func blueSliderAction() {
     changeColor()
     let ae = abc(a: sliderBlue.value)
    brightnessBlue.text = ae.formatted()
 }
 
 func setupLabel() {
     brightnessRed.text = sliderRed.value.formatted()
     brightnessGreen.text = sliderGreen.value.formatted()
     brightnessBlue.text = sliderBlue.value.formatted()
 }
 
 func changeColor() {
     mainView.backgroundColor = UIColor(red: CGFloat(sliderRed.value), green: CGFloat(sliderGreen.value), blue: CGFloat(sliderBlue.value), alpha: 1)
 }
 
 */
