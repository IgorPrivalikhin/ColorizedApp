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
    
    @IBOutlet var brightnessRed: UILabel!
    @IBOutlet var brightnessGreen: UILabel!
    @IBOutlet var brightnessBlue: UILabel!
    
    @IBOutlet var sliderRed: UISlider!
    @IBOutlet var sliderGreen: UISlider!
    @IBOutlet var sliderBlue: UISlider!
    
    
    override func viewDidLoad() {
        mainView.layer.cornerRadius = 15
        super.viewDidLoad()
        setupSliderRed()
        setupSliderGreen()
        setupSliderBlue()
        setupLabel()
    }
    
    @IBAction func redSliderAction() {
        brightnessRed.text = sliderRed.value.rounded().formatted()
        mainView.backgroundColor = .red
        mainView.backgroundColor = mainView.backgroundColor?.withAlphaComponent(CGFloat(sliderRed.value))
    }
    
    @IBAction func greenSliderAction() {
        brightnessGreen.text = sliderGreen.value.rounded().formatted()
        mainView.backgroundColor = .green
       mainView.backgroundColor = mainView.backgroundColor?.withAlphaComponent(CGFloat(sliderGreen.value))
    }
    
    @IBAction func blueSliderAction() {
        brightnessBlue.text = sliderBlue.value.rounded().formatted()
        mainView.backgroundColor = .blue
       mainView.backgroundColor = mainView.backgroundColor?.withAlphaComponent(CGFloat(sliderBlue.value))
    }

    func setupLabel() {
        brightnessRed.text = sliderRed.value.formatted()
        brightnessGreen.text = sliderGreen.value.formatted()
        brightnessBlue.text = sliderBlue.value.formatted()
   }
    
    
    private func setupSliderRed() {
        sliderRed.value = 0.2
        sliderRed.minimumValue = 0
        sliderRed.maximumValue = 1
        sliderRed.minimumTrackTintColor = .red
    }
    private func setupSliderGreen() {
        sliderGreen.value = 0.4
        sliderGreen.minimumValue = 0
        sliderGreen.maximumValue = 1
        sliderGreen.minimumTrackTintColor = .green
    }
    private func setupSliderBlue() {
        sliderBlue.value = 0.6
        sliderBlue.minimumValue = 0
        sliderBlue.maximumValue = 1
        sliderBlue.minimumTrackTintColor = .blue
    }
    
}

/*  slider.value = 1 // значение слайдера
  slider.minimumValue = 0 // мин значение
  slider.maximumValue = 1 // макс значение
  slider.minimumTrackTintColor = .yellow // цвет шкалы минимум
  slider.maximumTrackTintColor = .red
  slider.thumbTintColor = .blue // цвет бегунка
 */

/*
mainLabel.text = slider.value.formatted() // ""- по умолчанию делали пустой, после создания настройки слайдера в него поместили значение слайдера и методом formatted преобразовали в string
mainLabel.font = UIFont.systemFont(ofSize: 35) // systemFont - метод для системного шрифта
mainLabel.textAlignment = .center // textAlignment - размещение текста внутри лейбла (по центру)
mainLabel.numberOfLines = 2 // количество строк в лейбле
*/

/* extension ViewController {
 func abc (a: Float) -> String {
 let _ = Float(round(1000 * a) / 1000)
 }
 return
 }
 */
