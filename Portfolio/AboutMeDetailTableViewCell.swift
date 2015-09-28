//
//  AboutMeDetailTableViewCell.swift
//  Portfolio
//
//  Created by Raymond Brion on 9/28/15.
//  Copyright © 2015 Raymond Brion. All rights reserved.
//

import UIKit

class AboutMeDetailTableViewCell: UITableViewCell
{
  @IBOutlet weak var detailLabel: UILabel!
  @IBOutlet weak var iconImageView: UIImageView!
  
  var internalAboutMeDetail: AboutMeDetail?

  var aboutMeDetail: AboutMeDetail?
  {
    get
    {
      return internalAboutMeDetail;
    }
    set (newAboutMeDetail)
    {
      self.internalAboutMeDetail = newAboutMeDetail
      detailLabel.text = newAboutMeDetail?.displayText
      iconImageView.image = newAboutMeDetail?.image
    }
  }
  
  // MARK: - Initialization

  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
  }
  
}
