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
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    // MARK: - Public Properties
    var mainViewColor: UIColor!
    var delegate: ViewControllerDelegate!
    
    // MARK: - View Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.backgroundColor = mainViewColor
        
        mainView.layer.cornerRadius = 15
        
        sliderRed.tintColor = .red
        sliderGreen.tintColor = .green
      
        setValue(for: sliderRed, sliderGreen, sliderBlue)
        setValue(for: valueRedLabel, valueGreenLabel, valueBlueLabel)
        setValue(for: redTextField, greenTextField, blueTextField)
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IB Action
    
    @IBAction func SliderAction(_ sender: UISlider) {
        switch sender {
        case sliderRed:
            setValue(for: valueRedLabel)
            setValue(for: redTextField)
        case sliderGreen:
            setValue(for: valueGreenLabel)
            setValue(for: greenTextField)
        default:
            setValue(for: valueBlueLabel)
            setValue(for: blueTextField)
        }
        
        setColor()
    }
    
        //changeColor()
        //setupLabel()
    
    @IBAction func doneButton() {
        delegate.changeColor(mainView: mainView.backgroundColor ?? .blue)
        dismiss(animated: true)
    }
}

    // MARK: - Private Methods
extension ViewController {
    
    private func setColor() {
        mainView.backgroundColor = UIColor(
            red: CGFloat(sliderRed.value),
            green: CGFloat(sliderGreen.value),
            blue: CGFloat(sliderBlue.value),
            alpha: 1
        )
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case valueRedLabel: label.text = string(from: sliderRed)
            case valueGreenLabel: label.text = string(from: sliderGreen)
            default: label.text = string(from: sliderBlue)
            }
        }
    }
    
    private func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTextField: textField.text = string(from: sliderRed)
            case greenTextField: textField.text = string(from: sliderGreen)
            default: textField.text = string(from: sliderBlue)
            }
        }
    }
    
    private func setValue(for colorSliders: UISlider...) {
        let ciColor = CIColor(color: mainViewColor)
        colorSliders.forEach { slider in
            switch slider {
            case sliderRed: sliderRed.value = Float(ciColor.red)
            case sliderGreen: sliderGreen.value = Float(ciColor.green)
            default: sliderBlue.value = Float(ciColor.blue)
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }

}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            switch textField {
            case redTextField:
                sliderRed.setValue(currentValue, animated: true)
                setValue(for: valueRedLabel)
            case greenTextField:
                sliderGreen.setValue(currentValue, animated: true)
                setValue(for: valueGreenLabel)
            default:
                sliderBlue.setValue(currentValue, animated: true)
                setValue(for: valueBlueLabel)
            }
            
            setColor()
            return
        }
        
        showAlert(title: "Wrong format!", message: "Please enter correct value")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        textField.inputAccessoryView = keyboardToolbar
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(didTapDone)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
}
    

