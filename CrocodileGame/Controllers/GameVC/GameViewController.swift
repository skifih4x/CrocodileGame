//
//  GameViewController.swift
//  CrocodileGame
//
//  Created by Артем Орлов on 16.04.2023.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController {
    
    var timer = Timer()
    var counter = 60
    var player: AVAudioPlayer!
  
    class DataManager {
        static let shared = DataManager()
        var totalRounds = 0
        var currentTeam = 1
        var numberOfTeams = 1
    }
        
    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "background"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
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
        label.text = "1:00"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        timer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(self.updateTimer), userInfo:nil, repeats: true)
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
        label.text = howToExplainArray.randomElement()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var rightButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.455, green: 0.655, blue: 0.188, alpha: 1)
        button.setTitle("Правильно", for: .normal)
        button.setTitleColor(.white, for: .normal)
        switch button.state {
        case .normal: button.alpha = 1
        case .selected, .highlighted, .disabled: button.alpha = 0.8
        default:
            button.alpha = 1
        }
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tapRightButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled  = true
        return button
    }()
    
    private lazy var wrongButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.902, green: 0.275, blue: 0.275, alpha: 1)
        button.setTitle("Нарушил правила", for: .normal)
        button.setTitleColor(.white, for: .normal)
        switch button.state {
        case .normal: button.alpha = 1
        case .selected, .highlighted, .disabled: button.alpha = 0.8
        default:
            button.alpha = 1
        }
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tapWrongButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled  = true
        return button
    }()
    
    private lazy var resetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.551, green: 0.568, blue: 0.587, alpha: 1)
        button.setTitle("Сбросить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        switch button.state {
        case .normal: button.alpha = 1
        case .selected, .highlighted, .disabled: button.alpha = 0.8
        default:
            button.alpha = 1
        }
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tapResetButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled  = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subviews()
        setupConstraints()
        navigationItem.hidesBackButton = true
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
        ])
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    @objc func updateTimer() {
        switch counter {
        case 1...10:
            counter -= 1
            timerLabel.text = "0:0\(counter.description)"
        case 11:
            playSound(soundName: "10sec")
            counter -= 1
            timerLabel.text = "0:\(counter.description)"
        case 12...60:
            counter -= 1
            timerLabel.text = "0:\(counter.description)"
        case 0:
            timerLabel.text = "ВРЕМЯ ВЫШЛО"
            timerLabel.textColor = .red
        default:
            timer.invalidate()
        }
    }
    
    @objc func tapRightButton() {
        let dm = DataManager.shared
        dm.currentTeam += 1
        if dm.currentTeam > dm.numberOfTeams {
            dm.currentTeam = 1
        }
        dm.totalRounds += 1
        let VC = ScoreTeamViewController()
        playSound(soundName: "pravilnyiy-otvet")
        navigationController?.pushViewController(VC, animated: true)
    }
    
    @objc func tapWrongButton() {
        let dm = DataManager.shared
        dm.currentTeam += 1
        if dm.currentTeam > dm.numberOfTeams {
            dm.currentTeam = 1
        }
        dm.totalRounds += 1
        let VC = ScoreTeamViewController()
        VC.congratsLabel.text = "УВЫ И АХ!"
        VC.youGotLabel.text = "Вы не отгадали слово и не получаете очков!"
        VC.resultLabel.text = "0"
        VC.resultOfRoundView.backgroundColor = UIColor(red: 0.902, green: 0.275, blue: 0.275, alpha: 1)
        playSound(soundName: "game-lost")
        navigationController?.pushViewController(VC, animated: true)
    }
    
    @objc func tapResetButton() {
        let ac = UIAlertController(title: "Сбросить игру?", message: "Вы хотите сбросить вашу игру и вернуться в главное меню?", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Отмена", style: .default, handler: nil))
        present(ac, animated: true, completion: nil)
        ac.addAction(UIAlertAction(title: "Да", style: .destructive, handler: { (action: UIAlertAction!) in
            let VC = MainViewController()
            self.navigationController?.pushViewController(VC, animated: true)
        }))
    }
}
