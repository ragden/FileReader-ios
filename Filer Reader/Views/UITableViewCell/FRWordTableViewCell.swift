//
//  FRWordTableViewCell.swift
//  Filer Reader
//
//  Created by Edgar Paz on 18/10/17.
//  Copyright © 2017 edgar paz moreno. All rights reserved.
//

import UIKit

class FRWordTableViewCell: UITableViewCell {
    static let identifier : String = "cell"
    
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        leftLabel.textColor = UIColor.corporateBlue
        rightLabel.textColor = UIColor.corporateLightBlue
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadData(data: WordCount) {
        //Do stuff
    }

}
