//
//  GFFollowersItemVC.swift
//  GitFollowers
//
//  Created by Hoang on 25.5.2020.
//  Copyright © 2020 Hoang. All rights reserved.
//

import UIKit

protocol GFFollowersItemDelegate: class {
    
    func didTapGetFollowers(for user: User)
}

class GFFollowersItemVC: GFItemInfoVC {

    weak var delegate: GFFollowersItemDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureItem()
    }
    
    
    private func configureItem() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }

}
