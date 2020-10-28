//
//  InstagramCollectionView.swift
//  Revels-20
//
//  Created by Rohit Kuber on 27/09/20.
//  Copyright © 2020 Naman Jain. All rights reserved.
//

import UIKit

class InstagramCollectionView: UICollectionViewCell,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
   
    
    var instData = [Node]()
    let cellId = "cellId"
    let cellPadding : CGFloat = 16
    
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.text = "POSTS"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = UIColor(white: 1, alpha: 0.7)
        label.textColor = .white
        return label
    }()
    
    lazy var titleBackgroundText: UILabel = {
        let label = UILabel()
        label.text = "POSTS"
        label.font = UIFont.systemFont(ofSize: 90, weight: .bold)
        label.textColor = UIColor(white: 0.4, alpha: 0.3)
        label.textAlignment = .center
        return label
       }()
    
    lazy var instagramCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .black
        cv.register(InstagramCell.self, forCellWithReuseIdentifier: cellId)
        return cv
    }()
    
    lazy var seperatorLineView: UIView = {
        let view = UIView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        Networking.sharedInstance.getInstaPosts { (res) in
////            print("insta data recieved: ------------------------")
////            print(res)
////            print("\n\n")
//        }
        
       getInsData()
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(instData.count)
        return instData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! InstagramCell
        let data = instData[indexPath.item]
        print(data.node.display_url)
        cell.postImageView.sd_setImage(with: URL(string: data.node.display_url), placeholderImage: UIImage(named: "logo.png"))
        cell.profilePhotoImageview = UIImageView(image: UIImage(named: "logo_dark.png"))
        cell.backgroundColor = .black
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: UIViewController().view.frame.width-48 , height: UIViewController().view.frame.height/2)

    }
    
    fileprivate func setupLayout(){
        
        addSubview(titleBackgroundText)
        _ = titleBackgroundText.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant:2, leftConstant: -32, bottomConstant: 0, rightConstant: -32, widthConstant: 0, heightConstant: 0)
        
        
        addSubview(titleLabel)
        _ = titleLabel.anchor(top: titleBackgroundText.topAnchor, left: leftAnchor, bottom: titleBackgroundText.bottomAnchor, right: rightAnchor, topConstant: 6, leftConstant: 16, bottomConstant: 0, rightConstant: 16, heightConstant: 0)
      
    
       addSubview(instagramCollectionView)
       instagramCollectionView.anchorWithConstants(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 2, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        
    }
    
    func getInsData(){
        print("Getting Insta links")
        let urlString = "https://3a8f4c428a03.ngrok.io/posts/mittechtatva"
        let url = URL(string: urlString)
        guard url != nil else {
            print("wrong url")
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                let decoder = JSONDecoder()
                
                do{
                    let instafeed = try decoder.decode(Edges.self, from: data!)
                    self.instData = instafeed.edges
                    print(self.instData)
                } catch{
                    print(error)
                    print("error in json parsing")
                }
                DispatchQueue.main.async {
                    self.instagramCollectionView.reloadData()
                }
                
            }
        }
        dataTask.resume()
    }
    
    
}



    

