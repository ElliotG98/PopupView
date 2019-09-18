//
//  ViewController.swift
//  Popup
//
//  Created by Elliot Glaze on 18/09/2019.
//  Copyright © 2019 Elliot Glaze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let popupView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0.5
        view.isHidden = true
        return view
    }()
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.backgroundColor = .purple
        label.text = "Select Date"
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let datePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.translatesAutoresizingMaskIntoConstraints = false
        dp.datePickerMode = .date
        return dp
    }()
    
    let saveDateButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save Date", for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    let openPopupButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 40, y: 100, width: 50, height: 50))
        button.setTitle("Open", for: .normal)
        button.backgroundColor = .red
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupOpenPopupButton()
        setupPopup()
        
        
        
    }
    
    func setupOpenPopupButton() {
        view.addSubview(openPopupButton)
        openPopupButton.addTarget(self, action: #selector(handleOpenPopup), for: .touchUpInside)
    }
    
    @objc func handleOpenPopup() {
        popupView.isHidden = false
    }
    
    
    func setupPopup() {
        view.addSubview(popupView)
        popupView.addSubview(titleLabel)
        popupView.addSubview(datePicker)
        popupView.addSubview(saveDateButton)
        
        saveDateButton.addTarget(self, action: #selector(handleClosePopup), for: .touchUpInside)
        
        
        popupView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        popupView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        popupView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        popupView.widthAnchor.constraint(equalToConstant: view.frame.width - 100).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: popupView.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: popupView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: popupView.trailingAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: datePicker.topAnchor).isActive = true
        
        datePicker.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        datePicker.leadingAnchor.constraint(equalTo: popupView.leadingAnchor).isActive = true
        datePicker.trailingAnchor.constraint(equalTo: popupView.trailingAnchor).isActive = true
        datePicker.bottomAnchor.constraint(equalTo: saveDateButton.topAnchor).isActive = true
        
        saveDateButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor).isActive = true
        saveDateButton.leadingAnchor.constraint(equalTo: popupView.leadingAnchor).isActive = true
        saveDateButton.trailingAnchor.constraint(equalTo: popupView.trailingAnchor).isActive = true
        saveDateButton.bottomAnchor.constraint(equalTo: popupView.bottomAnchor).isActive = true
    }
    
    @objc func handleClosePopup() {
        popupView.isHidden = true
    }


}

