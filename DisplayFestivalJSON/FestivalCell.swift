//
//  FestivalCell.swift
//  DisplayFestivalJSON
//
//  Created by Stephen Ouyang on 2/11/19.
//  Copyright © 2019 Stephen Ouyang. All rights reserved.
//

import UIKit

class FestivalCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    var artistLabel: UILabel = {
        var artistLabelFrame = UILabel(frame: .zero)
        artistLabelFrame.translatesAutoresizingMaskIntoConstraints = false
        artistLabelFrame.text = "Artist"
        return artistLabelFrame
    }()
    
    func labelConstraints() {
        artistLabel.widthAnchor.constraint(equalToConstant: bounds.width/5).isActive = true
        artistLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        artistLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        artistLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        addSubview(artistLabel)
        labelConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
