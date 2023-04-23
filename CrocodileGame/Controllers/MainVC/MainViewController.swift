//
//  MainViewController.swift
//  CrocodileGame
//
//  Created by Артем Орлов on 16.04.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var backgroundImage: UIImageView = .background
    private lazy var crocodile: UIImageView = .crocodile
    private lazy var grassLeft: UIImageView = .grass
    private lazy var grassRight: UIImageView = .grass
    
    private lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("Начать игру", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.4549019608, green: 0.6549019608, blue: 0.1882352941, alpha: 1)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(start), for: .touchUpInside)
        return button
        }()
    
    private lazy var rulesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("Правила", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.4549019608, green: 0.6549019608, blue: 0.1882352941, alpha: 1)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(rules), for: .touchUpInside)
        return button

    }()
    
    private lazy var resultButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("Результаты", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9922702909, green: 0.5495662093, blue: 0, alpha: 1)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(result), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
      navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
      
    }
    
    private func setupView () {
        view.addSubview(backgroundImage)
        view.addSubview(crocodile)
        view.addSubview(grassLeft)
        view.addSubview(grassRight)
        view.addSubview(startButton)
        view.addSubview(rulesButton)
        view.addSubview(resultButton)
    }
    
    @objc func start () {
        let destinationViewController = TeamViewController()
        self.navigationController?.pushViewController(destinationViewController, animated: true)
    }
    
    @objc func rules () {
        let destinationViewController = RulesViewController()
        self.navigationController?.pushViewController(destinationViewController, animated: true)

    }
    
    @objc func result () {
        let destinationViewController = TeamLeadersViewController()
        self.navigationController?.pushViewController(destinationViewController, animated: true)

    }
    
}

extension MainViewController {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            crocodile.topAnchor.constraint(equalTo: view.topAnchor,constant: 103),
            crocodile.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 53),
            crocodile.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -54),
            
            startButton.topAnchor.constraint(equalTo: crocodile.bottomAnchor,constant: 23),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 51),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -51),
            startButton.heightAnchor.constraint(equalToConstant: 83),
            
            grassLeft.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            grassLeft.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            grassRight.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            grassRight.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            rulesButton.topAnchor.constraint(equalTo: startButton.bottomAnchor,constant: 23),
            rulesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 82),
            rulesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -82),
            rulesButton.heightAnchor.constraint(equalToConstant: 63),
            
            resultButton.topAnchor.constraint(equalTo: rulesButton.bottomAnchor,constant: 18),
            resultButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 82),
            resultButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -82),
            resultButton.heightAnchor.constraint(equalToConstant: 63),
            
        ])
    }
}
