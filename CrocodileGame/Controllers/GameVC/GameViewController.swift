//
//  GameViewController.swift
//  CrocodileGame
//
//  Created by Артем Орлов on 16.04.2023.
//

import UIKit

class GameViewController: UIViewController {
    
    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "background"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var crocodileImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "crocodile"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var timerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 48, weight: .bold)
        label.text = "00:59"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var whichWordLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 48, weight: .bold)
        label.text = "Картошка"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var howToExplainLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.text = "Обьясни с помощью жестов"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.clipsToBounds = true
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var rightButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.455, green: 0.655, blue: 0.188, alpha: 1)
        button.setTitle("Правильно", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        //        button.addTarget(self, action: #selector(self.didTapXButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled  = true
        return button
    }()
    
    private lazy var wrongButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.902, green: 0.275, blue: 0.275, alpha: 1)
        button.setTitle("Нарушил правила", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        //        button.addTarget(self, action: #selector(self.didTapXButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled  = true
        return button
    }()
    
    private lazy var resetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.551, green: 0.568, blue: 0.587, alpha: 1)
        button.setTitle("Сбросить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        //        button.addTarget(self, action: #selector(self.didTapXButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled  = true
        return button
    }()
    
    private lazy var errorLabel: UILabel = {
        let errorLabel = UILabel()
        errorLabel.isHidden = true
        errorLabel.text = ""
        errorLabel.font = .systemFont(ofSize: 11, weight: .bold)
        errorLabel.textColor = .systemRed
        errorLabel.textAlignment = .center
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        return errorLabel
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subviews()
        setupConstraints()
    }
    
    private func subviews() {
        view.addSubview(backgroundView)
        backgroundView.addSubview(crocodileImage)
        backgroundView.addSubview(timerLabel)
        backgroundView.addSubview(whichWordLabel)
        backgroundView.addSubview(howToExplainLabel)
        backgroundView.addSubview(buttonsStackView)
        buttonsStackView.addArrangedSubview(rightButton)
        buttonsStackView.addArrangedSubview(wrongButton)
        buttonsStackView.addArrangedSubview(resetButton)
        backgroundView.addSubview(errorLabel)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            crocodileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            crocodileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            timerLabel.topAnchor.constraint(equalTo: crocodileImage.bottomAnchor, constant: 57),
            timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerLabel.heightAnchor.constraint(equalToConstant: 37),
            
            whichWordLabel.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 90),
            whichWordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            whichWordLabel.heightAnchor.constraint(equalToConstant: 48),
            
            howToExplainLabel.topAnchor.constraint(equalTo: whichWordLabel.bottomAnchor, constant: 10),
            howToExplainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            howToExplainLabel.heightAnchor.constraint(equalToConstant: 48),
            
            buttonsStackView.topAnchor.constraint(equalTo: howToExplainLabel.bottomAnchor, constant: 100),
            buttonsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 200),
            
            errorLabel.bottomAnchor.constraint(equalTo: backgroundView.topAnchor, constant: -16),
            errorLabel.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 16),
            errorLabel.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -16)
        ])
    }
}
