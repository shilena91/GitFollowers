//
//  GFRepoItemVC.swift
//  GitFollowers
//
//  Created by Hoang on 25.5.2020.
//  Copyright © 2020 Hoang. All rights reserved.
//

import UIKit

protocol GFRepoItemDelegate: class {
    
    func didTapGitHubProfile(for user: User)
}

class GFRepoItemVC: GFItemInfoVC {

    weak var delegate: GFRepoItemDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureItem()
    }
    
    
    private func configureItem() {
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "Github Profile")
    }
    
    
    override func actionButtonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }
    
}
