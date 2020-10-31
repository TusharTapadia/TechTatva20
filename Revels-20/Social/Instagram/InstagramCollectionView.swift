//
//  InstagramCollectionView.swift
//  Revels-20
//
//  Created by Rohit Kuber on 27/09/20.
//  Copyright © 2020 Naman Jain. All rights reserved.
//

import UIKit
import Disk
import SDWebImage

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
        
       getInstaData()
        
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
        print(data)
        print(data.node.display_url)
        cell.postImageView.sd_setImage(with: URL(string: data.node.display_url), placeholderImage: UIImage(named: "logo.png"))
        cell.profilePhotoImageview = UIImageView(image: UIImage(named: "logo_dark.png"))
        
        cell.likeLabel.text = String(data.node.edge_liked_by.count)
        cell.commentsLabel.text = String(data.node.edge_media_to_comment.count)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = instData[indexPath.item]
        let url = ""
        let webURL = NSURL(string: url)!
        let application = UIApplication.shared
        application.open(webURL as URL)
    }
    
    fileprivate func setupLayout(){
        
        addSubview(titleBackgroundText)
        _ = titleBackgroundText.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant:2, leftConstant: -32, bottomConstant: 0, rightConstant: -32, widthConstant: 0, heightConstant: 0)
        
        
        addSubview(titleLabel)
        _ = titleLabel.anchor(top: titleBackgroundText.topAnchor, left: leftAnchor, bottom: titleBackgroundText.bottomAnchor, right: rightAnchor, topConstant: 6, leftConstant: 16, bottomConstant: 0, rightConstant: 16, heightConstant: 0)
      
    
       addSubview(instagramCollectionView)
       instagramCollectionView.anchorWithConstants(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 2, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        
    }
    
    func getInstaData() {
            let url = URL(string: "http://159.65.146.229:5000/insta/mittechtatva")!
            let session = URLSession.shared.dataTask(with: url) { (data, res, err) in
                let decoder = JSONDecoder()
                do {
                    let parData = try decoder.decode(Instagram.self, from: data!)

                    let mediaContent = parData.entry_data.ProfilePage[0].graphql.user.edge_owner_to_timeline_media.edges
                    
//                    print(mediaContent)
                    
                    self.instData = mediaContent
                    
                    for k in mediaContent {
                        // display url
//                        print(k.node.display_url)
//                        // like count on post
//                        print(k.node.edge_liked_by.count)
//                        // comment count on post
//                        print(k.node.edge_media_to_comment.count)
                        
                        
                        // intsta post redirect link
                        let redirectLink = "https://www.instagram.com/p/\(k.node.shortcode)"
                        print(redirectLink)
                        
                        print("\n\n")
                    }
                } catch {
                print(err?.localizedDescription)
                }
            }
            
            session.resume()
        }
    
    
}



    

