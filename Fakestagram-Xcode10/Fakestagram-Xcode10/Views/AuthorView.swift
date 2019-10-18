//
//  AuthorView.swift
//  Fakestagram-Xcode10
//
//  Created by Bruno Torres on 10/12/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit
import UIKit

class AuthorView: UIView {

    var author: Author?{
        didSet{updateContent()}
    }
    
    private let avatar: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "asd")
        iv.contentMode = UIImageView.ContentMode.scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let nameLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Lorem ipsum"
        return lbl
    }()
    
    convenience init(){
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupConstrains()
    }
    
    func setupConstrains(){
        addSubview(avatar)
        NSLayoutConstraint.activate([
            avatar.topAnchor.constraint(equalTo: self.topAnchor, constant: 3),
            avatar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
            avatar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 3)
        ])
        
        addSubview(nameLbl)
        NSLayoutConstraint.activate([
            nameLbl.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 5),
            nameLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 3),
            nameLbl.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
    }
    
    func updateContent(){
        guard let author = author else{return}
        nameLbl.text = author.name
    }
    
    

}
