//
//  EventViewController.swift
//  TechTetva-19
//
//  Created by Naman Jain on 01/09/19.
//  Copyright © 2019 Naman Jain. All rights reserved.
//

import UIKit
import Disk
import AudioToolbox
import FirebaseMessaging

class TeamTableViewController: UITableViewController {
    
    var event: Event! {
        didSet{
            tableView.reloadData()
        }
    }
    
   
    
    var user: User?{
        didSet{
            
        }
    }
    
    var userStatusUpdate: User?{
        didSet{
            Caching.sharedInstance.saveUserDetailsToCache(user: userStatusUpdate)
        }
    }
    
    var categoriesDictionary = [String: Category]()
    var delegateDictionary = [Int: DelegateCard]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor.CustomColors.Black.background
        tableView.register(TeamCell.self, forCellReuseIdentifier: "cellId")
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0)
        getCachedUserDetails()
    }

    func getCachedUserDetails(){
        self.user =  Caching.sharedInstance.getUserDetailsFromCache()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 5
    }
    
//     This is shown when you tap on a schedule and event cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! TeamCell
        cell.contentView.isUserInteractionEnabled = false
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.CustomColors.Black.background
        //Here team id and party code
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.text = "Team Details"
        
        let partyCodeLabel = UILabel()
        partyCodeLabel.textColor = .white
        partyCodeLabel.font = UIFont.systemFont(ofSize: 13)
        partyCodeLabel.textAlignment = .center
        partyCodeLabel.numberOfLines = 2
        partyCodeLabel.text = "Party Code"
        
        let partyCodeValue = UILabel()
        partyCodeValue.textColor = .red
        partyCodeValue.font = UIFont.systemFont(ofSize: 13)
        partyCodeValue.textAlignment = .center
        partyCodeValue.numberOfLines = 2
        partyCodeValue.text = "N/A"
        
        if isSmalliPhone(){
            label.font = UIFont.boldSystemFont(ofSize: 15)
            partyCodeLabel.font = UIFont.systemFont(ofSize: 12)
        }else{
            label.font = UIFont.boldSystemFont(ofSize: 18)
        }
        
            view.addSubview(label)
            _ = label.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 12, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 25)

            view.addSubview(partyCodeLabel)
           _ = partyCodeLabel.anchor(top: label.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: nil, topConstant: 8, leftConstant: 32, bottomConstant: 8, rightConstant: 0,widthConstant: UIViewController().view.frame.width/2-40)

            view.addSubview(partyCodeValue)
        _ = partyCodeValue.anchor(top: label.bottomAnchor, left: partyCodeLabel.rightAnchor, bottom: view.bottomAnchor, right: nil, topConstant: 8, leftConstant: 16, bottomConstant: 8, rightConstant: 0,widthConstant: UIViewController().view.frame.width/2-40)
        
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 95
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension //60
    }
    
    
    

        
}


class TeamCell: UITableViewCell{
    
    lazy var memberID: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.text = "Member id:"
        return label
    }()
    
    lazy var removeButton : UIButton = {
        let button2 = UIButton()
        button2.backgroundColor = #colorLiteral(red: 0.7536286485, green: 0.1785056603, blue: 0.07220073951, alpha: 1)
        button2.setTitle("Remove", for: UIControl.State())
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.startAnimatingPressActions()
        button2.layer.cornerRadius = 10
        button2.setTitleColor(.white, for: UIControl.State())
        button2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button2.layer.cornerRadius = 10
        return button2
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
       setupLayout()
    }
    
    func setupLayout(){
        addSubview(memberID)
        
        _ = memberID.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 16, leftConstant: 8, bottomConstant: 8, rightConstant: 0, widthConstant: frame.width/2 - 40, heightConstant: 0)
        
        addSubview(removeButton)
        
        _ = removeButton.anchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, topConstant: 16, leftConstant: 0, bottomConstant: 8, rightConstant: 16, widthConstant: frame.width/2 - 40, heightConstant: 0)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

