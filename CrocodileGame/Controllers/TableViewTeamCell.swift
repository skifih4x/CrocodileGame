//
//  TableViewTeamCell.swift
//  CrocodileGame
//
//  Created by Николай on 17.04.2023.
//

import UIKit

class TableViewTeamCell: UITableViewCell {
    
    var imageLogo: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var labelNameTeam: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var labelCount: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.CookieRegular(with: 56)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
 }()
    
    var labelPoint: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "Очки"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
 }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(imageLogo)
        contentView.addSubview(labelNameTeam)
        contentView.addSubview(labelCount)
        contentView.addSubview(labelPoint)
        
        imageLogo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        imageLogo.widthAnchor.constraint(equalToConstant: 56).isActive = true
        imageLogo.heightAnchor.constraint(equalToConstant: 56).isActive = true
        imageLogo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 33).isActive = true
        
        labelNameTeam.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50).isActive = true
        labelNameTeam.leadingAnchor.constraint(equalTo: imageLogo.trailingAnchor, constant: 34).isActive = true
        labelNameTeam.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30).isActive = true
        labelNameTeam.widthAnchor.constraint(equalToConstant: 160).isActive = true
        
        labelCount.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        labelCount.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        labelCount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        labelCount.widthAnchor.constraint(equalToConstant: 57).isActive = true
        
        labelPoint.topAnchor.constraint(equalTo: labelCount.bottomAnchor, constant: 0).isActive = true
        labelPoint.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        labelPoint.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        labelPoint.widthAnchor.constraint(equalToConstant: 57).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func set(buttonImage: String) {
        imageLogo.image = UIImage(named: buttonImage)
    }
    
    func set(teamName: String){
        labelNameTeam.text = teamName
    }
    
}
