//
//  ScoreTeamViewController.swift
//  CrocodileGame
//
//  Created by Артем Орлов on 16.04.2023.
//

import UIKit

class ScoreTeamViewController: UIViewController {
    
    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "background"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private lazy var teamView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var avatarTeamImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "avatar_cowboy"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var teamNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.text = "Ковбои"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var teamScoreView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var teamScoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 50, weight: .regular)
        label.text = "1"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var scoreTopLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        label.text = "Очки"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var resultOfRoundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.455, green: 0.655, blue: 0.188, alpha: 1)
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
     var congratsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.text = "Поздравляем"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     var youGotLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.text = "Вы получаете"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var starImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "star_icon"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
      var resultLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 70, weight: .regular)
        label.text = "1"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.text = "ОЧКИ"
        label.textColor = .yellow
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nextTurnLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.text = "следующий ход - "
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var passButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 351, height: 60)
        button.backgroundColor = UIColor(red: 0.455, green: 0.655, blue: 0.188, alpha: 1)
        button.setTitle("Передать ход", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled  = true
        button.addTarget(self, action: #selector(tapPassButton), for: .touchUpInside)
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
        backgroundView.addSubview(teamView)
        backgroundView.addSubview(resultOfRoundView)
        backgroundView.addSubview(passButton)
        teamView.addSubview(avatarTeamImage)
        teamView.addSubview(teamNameLabel)
        teamView.addSubview(teamScoreView)
        teamScoreView.addSubview(teamScoreLabel)
        teamScoreView.addSubview(scoreTopLabel)
        resultOfRoundView.addSubview(congratsLabel)
        resultOfRoundView.addSubview(youGotLabel)
        resultOfRoundView.addSubview(starImage)
        starImage.addSubview(resultLabel)
        resultOfRoundView.addSubview(scoreLabel)
        resultOfRoundView.addSubview(nextTurnLabel)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            teamView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            teamView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 12),
            teamView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -12),
            teamView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            
            avatarTeamImage.leadingAnchor.constraint(equalTo: teamView.leadingAnchor, constant: 15),
            avatarTeamImage.topAnchor.constraint(equalTo: teamView.topAnchor, constant: 15),
            avatarTeamImage.bottomAnchor.constraint(equalTo: teamView.bottomAnchor, constant: -15),
            avatarTeamImage.widthAnchor.constraint(equalToConstant: 80),
            avatarTeamImage.heightAnchor.constraint(equalToConstant: 80),
            
            teamNameLabel.leadingAnchor.constraint(equalTo: avatarTeamImage.trailingAnchor, constant: 15),
            teamNameLabel.centerYAnchor.constraint(equalTo: avatarTeamImage.centerYAnchor),
            
            teamScoreView.trailingAnchor.constraint(equalTo: teamView.trailingAnchor, constant: -40),
            teamScoreView.centerYAnchor.constraint(equalTo: avatarTeamImage.centerYAnchor),
            
            teamScoreLabel.topAnchor.constraint(equalTo: teamScoreView.topAnchor),
            teamScoreLabel.centerXAnchor.constraint(equalTo: teamScoreView.centerXAnchor),
            
            scoreTopLabel.topAnchor.constraint(equalTo: teamScoreLabel.bottomAnchor),
            scoreTopLabel.centerXAnchor.constraint(equalTo: teamScoreView.centerXAnchor),
            scoreTopLabel.bottomAnchor.constraint(equalTo: teamScoreView.bottomAnchor),
            
            resultOfRoundView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            resultOfRoundView.topAnchor.constraint(equalTo: teamView.bottomAnchor, constant: 86),
            resultOfRoundView.heightAnchor.constraint(equalToConstant: 301),
            resultOfRoundView.widthAnchor.constraint(equalToConstant: 351),
            
            congratsLabel.topAnchor.constraint(equalTo: resultOfRoundView.topAnchor, constant: 43),
            congratsLabel.centerXAnchor.constraint(equalTo: resultOfRoundView.centerXAnchor),
            
            youGotLabel.topAnchor.constraint(equalTo: congratsLabel.bottomAnchor, constant: 24),
            youGotLabel.centerXAnchor.constraint(equalTo: resultOfRoundView.centerXAnchor),
            
            starImage.topAnchor.constraint(equalTo: youGotLabel.bottomAnchor, constant: 4),
            starImage.centerXAnchor.constraint(equalTo: resultOfRoundView.centerXAnchor),
            starImage.widthAnchor.constraint(equalToConstant: 100),
            starImage.heightAnchor.constraint(equalToConstant: 100),
            
            resultLabel.centerXAnchor.constraint(equalTo: starImage.centerXAnchor),
            resultLabel.centerYAnchor.constraint(equalTo: starImage.centerYAnchor),
           
            scoreLabel.centerXAnchor.constraint(equalTo: resultOfRoundView.centerXAnchor),
            scoreLabel.topAnchor.constraint(equalTo: starImage.bottomAnchor),
            
            nextTurnLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 5),
            nextTurnLabel.centerXAnchor.constraint(equalTo: resultOfRoundView.centerXAnchor),
            
            passButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            passButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 12),
            passButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -12),
            passButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    
    @objc func tapPassButton() {
        print("tapped")
    }
}
