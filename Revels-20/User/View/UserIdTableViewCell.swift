//
//  QRDelegateTableViewCell.swift
//  TechTetva-19
//
//  Created by Naman Jain on 28/09/19.
//  Copyright © 2019 Naman Jain. All rights reserved.
//

import UIKit
import SDWebImage

class UserIDTableViewCell: UITableViewCell {
    
    var usersViewController: UsersViewController?

    var user: User?{
        didSet{
            guard let user = user else { return }
                DispatchQueue.main.async {
                self.nameLabel.text = user.name
                self.emailLabel.text = user.email
                self.collegeLabel.text = user.college
            if let phoneno = user.phoneNo{
                self.phoneLabel.text = String(phoneno)
            }
            if let userid = user.userID{
                self.userIDLabel.text = String(userid)
        }
            if let userVerified = user.verified{
                self.titleBackgroundText.text = userVerified
                    }
                }
        }
}
    
    lazy var titleBackgroundText: UILabel = {
           let label = UILabel()
           label.text = "VIDEOS"
           label.font = UIFont.systemFont(ofSize: 72, weight: .bold)
           label.textColor = UIColor(white: 0.4, alpha: 0.3)
           label.textAlignment = .center
           return label
       }()
    
    let logoView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 14
        view.layer.shadowColor = UIColor.white.cgColor
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 12
        view.layer.masksToBounds = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.text = "Error 404"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    lazy var collegeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "There was an error"
        label.textColor = .lightGray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "fetching your details."
        label.textColor = .lightGray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "please log out and login again!"
        label.textColor = .lightGray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var userTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "User ID"
        label.textColor = UIColor.init(white: 1, alpha: 0.25)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var userIDLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 45)
        label.text = "NA"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"anonymous")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var eventsButton: LoadingButton = {
        let button = LoadingButton(type: .system)
        button.startAnimatingPressActions()
        button.backgroundColor = UIColor.CustomColors.Purple.register
        button.setTitle("Registered Events", for: UIControl.State())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: UIControl.State())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(showRegisteredEvents), for: .touchUpInside)
        return button
    }()
    
    lazy var delegateCardButton: LoadingButton = {
        let button = LoadingButton(type: .system)
        button.startAnimatingPressActions()
        button.backgroundColor = UIColor.CustomColors.Green.register
        button.setTitle("Delegate Cards", for: UIControl.State())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: UIControl.State())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 10
//        button.addTarget(self, action: #selector(showDelegateCards), for: .touchUpInside)
        return button
    }()
    

    @objc func showRegisteredEvents(){
        eventsButton.showLoading()
        eventsButton.activityIndicator.tintColor = .white
        eventsButton.isEnabled = false
        eventsButton.animateDown(sender: self.eventsButton)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) {
            self.eventsButton.animateUp(sender: self.eventsButton)
        }
            self.eventsButton.hideLoading()
            self.eventsButton.isEnabled = true
        
        guard let userReg = Caching.sharedInstance.getUserDetailsFromCache() else {return}
        
        if userReg.regEvents?.count == 0{
                FloatingMessage().longFloatingMessage(Message: "You have not registered for any events.", Color: .orange, onPresentation: {}) {}
                return
            }else{
                self.usersViewController?.showRegisteredEvents(RegisteredEvents: userReg.teamDetails ?? [])
            }
        self.eventsButton.hideLoading()
        self.eventsButton.isEnabled = true
    }
    
    
    lazy var logoutButton: LoadingButton = {
        let button = LoadingButton(type: .system)
        button.isUserInteractionEnabled = true
        button.setTitle("LOG OUT", for: UIControl.State())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.red, for: UIControl.State())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(handleLogout), for: .touchUpInside)
        return button
    }()
    
    @objc func handleLogout(){
        logoutButton.animateDown(sender: self.logoutButton)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) {
            self.logoutButton.animateUp(sender: self.logoutButton)
        }
        
        usersViewController?.logOutUser()
    }
    
    lazy var loveLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 12)        
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        
        if UIViewController().isSmalliPhone(){

            titleBackgroundText.font = UIFont.systemFont(ofSize: 72, weight: .bold)
            addSubview(titleBackgroundText)
            _ = titleBackgroundText.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 128, leftConstant: -12, bottomConstant: 0, rightConstant: -12, widthConstant: 0, heightConstant: 0)
            
            addSubview(nameLabel)
            _ = nameLabel.anchor(top: titleBackgroundText.topAnchor, left: leftAnchor, bottom: titleBackgroundText.bottomAnchor, right: rightAnchor, topConstant: 6, leftConstant: 16, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 0)
            
            nameLabel.font = UIFont.boldSystemFont(ofSize: 23)
            addSubview(nameLabel)
            _ = nameLabel.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 160, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 0)
            
            collegeLabel.font = UIFont.boldSystemFont(ofSize: 15)
            addSubview(collegeLabel)
            _ = collegeLabel.anchor(top: nameLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 12, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 0)
            phoneLabel.font = UIFont.boldSystemFont(ofSize: 15)
            addSubview(phoneLabel)
            _ = phoneLabel.anchor(top: collegeLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 0)
            emailLabel.font = UIFont.boldSystemFont(ofSize: 15)
            
            addSubview(emailLabel)
            _ = emailLabel.anchor(top: phoneLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 0)
            
            userTitleLabel.font = UIFont.boldSystemFont(ofSize: 13)
            addSubview(userTitleLabel)
            _ = userTitleLabel.anchor(top: emailLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 20, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 0)
            
            userIDLabel.font = UIFont.boldSystemFont(ofSize: 25)
            addSubview(userIDLabel)
            _ = userIDLabel.anchor(top: userTitleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 0)
            
            addSubview(eventsButton)
            _ = eventsButton.anchor(top: userIDLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 20, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 40)
            
            addSubview(logoutButton)
            _ = logoutButton.anchor(top: eventsButton.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 32, rightConstant: 16, widthConstant: 0, heightConstant: 40)
            
            eventsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
            delegateCardButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
            logoutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
            
        }else{
//            addSubview(logoImageView)
//            _ = logoImageView.anchor(top: safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil, topConstant: 24, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 200, heightConstant: 200)
//            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//            logoView.addSubview(spinnerView)
//            spinnerView.fillSuperview()
//            spinnerView.startAnimating()
//            logoView.addSubview(logoImageView)
//            logoImageView.fillSuperview(padding: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
            
            addSubview(titleBackgroundText)
            _ = titleBackgroundText.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 128, leftConstant: -12, bottomConstant: 0, rightConstant: -12, widthConstant: 0, heightConstant: 0)
            
            
            addSubview(nameLabel)
            _ = nameLabel.anchor(top: titleBackgroundText.topAnchor, left: leftAnchor, bottom: titleBackgroundText.bottomAnchor, right: rightAnchor, topConstant: 6, leftConstant: 16, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 0)
            
            addSubview(collegeLabel)
            _ = collegeLabel.anchor(top: nameLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 0)
            
            addSubview(phoneLabel)
            _ = phoneLabel.anchor(top: collegeLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 0)
            
            addSubview(emailLabel)
            _ = emailLabel.anchor(top: phoneLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 0)
            
            addSubview(userTitleLabel)
            _ = userTitleLabel.anchor(top: emailLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 32, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 0)
            
            addSubview(userIDLabel)
            _ = userIDLabel.anchor(top: userTitleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 0)
            
            addSubview(eventsButton)
            _ = eventsButton.anchor(top: userIDLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 24, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
        
            
            addSubview(logoutButton)
            _ = logoutButton.anchor(top: eventsButton.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 32, rightConstant: 16, widthConstant: 0, heightConstant: 50)
        }
        
        addSubview(loveLabel)
        _ = loveLabel.anchor(top: nil, left: leftAnchor, bottom: topAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 50, rightConstant: 16, widthConstant: 0, heightConstant: 30)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

