//
//  SportTableViewCell.swift
//  LoginViewCode
//
//  Created by Jean Camargo on 27/09/21.
//

import UIKit

class SportTableViewCell: UITableViewCell {
    
    var sportTableViewCellScreen: SportTableViewCellScreen = SportTableViewCellScreen()
    
    static let identifier: String = "SportTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubView()
        self.configConstraintsSportTableViewCellScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubView() {
        self.contentView.addSubview(self.sportTableViewCellScreen)
    }
    
    func configConstraintsSportTableViewCellScreen() {
        self.sportTableViewCellScreen.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    

}
