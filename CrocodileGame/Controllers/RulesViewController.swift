//
//  RulesViewController.swift
//  CrocodileGame
//
//  Created by Артем Орлов on 16.04.2023.
//

import UIKit

class RulesViewController: UIViewController {
    
    private lazy var backgroundImage: UIImageView = .background
    private lazy var text: UITextView = {
       let text = UITextView()
        text.text = " В игру играют командами из двух или более человек. \n\nЗадача каждого игрока команды - объяснить слово, которое он видит на экране, следуя условиям, которые дополнительно указаны под загаданным словом. \n\nЧем больше слов отгадала команда, тем больше она заработает баллов. \n\nВыигрывает команда, набравшая больше всего баллов. \n\nНа отгадывание слова дается одна минуту. \n\nПри нарушении правил объяснения слова, ход передается следующей команде\n\n...\n\n...."
        text.font = UIFont.systemFont(ofSize: 18)
        text.textColor = .black
        text.textAlignment = .left
        text.backgroundColor = .clear
        text.isEditable = false
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        setConstraints()
    }
    
    private func addView () {
        view.addSubview(backgroundImage)
        view.addSubview(text)
    }
}

    extension RulesViewController {
        
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            text.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            text.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            text.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            text.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
        ])
    }
}
