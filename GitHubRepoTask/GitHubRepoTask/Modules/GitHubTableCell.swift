//
//  GitHubTableCell.swift
//  GitHubRepoTask
//
//  Created by Raghad's Mac on 05/07/2021.
//

import UIKit

class GitHubTableCell: UITableViewCell {

   static let ID = "GitHubTableCell"
    let nib = R.nib.gitHubTableCell.name
    
    
    @IBOutlet weak var mainContainerView: UIView!
    @IBOutlet weak var repoNameLable: UILabel!
    @IBOutlet weak var repoOwnerNameLable: UILabel!
    @IBOutlet weak var repoCreatedAtLable: UILabel!

    @IBOutlet weak var repoAvatarImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViews()
        // Initialization code
    }
    
    private func setUpViews() {
        mainContainerView.shadow()
        repoAvatarImage.roundCorners(.allCorners, radius: 56)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(data: GitHubRepoListModel) {
        self.repoNameLable.text = data.name
        self.repoOwnerNameLable.text = data.owner?.login
        //self.repoCreatedAtLable.text = data.o
        let url = URL(string: data.owner?.avatar_url ?? "")
        let data = try? Data(contentsOf: url!)
        self.repoAvatarImage.image = UIImage(data: data!)
    }
    
}
