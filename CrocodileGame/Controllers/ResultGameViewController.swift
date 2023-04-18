//
//  ResultGameViewController.swift
//  CrocodileGame
//
//  Created by Артем Орлов on 16.04.2023.
//

import UIKit

class ResultGameViewController: UIViewController {
    
    var team = ["Ковбои", "Стройняшки", "Красотки","Ковбои"]
    var points = 5
    
    private lazy var labelResult: UILabel = {
       let label = UILabel()
        label.text = "Таблица лидеров"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 34)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var backgroundImage: UIImageView = .background
    
    private lazy var tableViewTeam: UITableView = {
        let tableView = UITableView()
        tableView.register(TableViewTeamCell.self, forCellReuseIdentifier: "team")
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.backgroundColor = .clear
        tableView.rowHeight = 100
//        tableView.layer.cornerRadius = 20
        tableView.isScrollEnabled = false
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var playAgainButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("Начать заново", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.4549019608, green: 0.6549019608, blue: 0.1882352941, alpha: 1)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(playAgain), for: .touchUpInside)
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
        
    }

    private func setupView () {
        self.navigationItem.hidesBackButton = true
        tableViewTeam.dataSource = self
        tableViewTeam.delegate = self
        view.addSubview(backgroundImage)
        view.addSubview(labelResult)
        view.addSubview(tableViewTeam)
        view.addSubview(playAgainButton)
    }
    
    @objc func playAgain () {
        let destinationViewController = TeamViewController()
        self.navigationController?.pushViewController(destinationViewController, animated: true)
    }

}

extension ResultGameViewController {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            labelResult.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            labelResult.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            tableViewTeam.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            tableViewTeam.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableViewTeam.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableViewTeam.heightAnchor.constraint(equalToConstant: CGFloat(team.count*100)),

            playAgainButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            playAgainButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            playAgainButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            playAgainButton.heightAnchor.constraint(equalToConstant: 70)
            
        ])
    }
}

extension ResultGameViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        team.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "team", for: indexPath) as? TableViewTeamCell else {
            return UITableViewCell()
        }
        
        let teamName = team[indexPath.row]
        cell.set(buttonImage: teamName)
        cell.set(teamName: teamName)
        cell.labelCount.text = String(points)
        cell.labelPoint.text = "Очки"
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: cell.contentView.frame.width, height: 25))
        myView.backgroundColor = #colorLiteral(red: 0.8439154029, green: 1, blue: 0.6671893001, alpha: 1)
//        cell.contentView.layer.cornerRadius = 20
        cell.contentView.addSubview(myView)
        cell.contentView.sendSubviewToBack(myView)
    }

}
