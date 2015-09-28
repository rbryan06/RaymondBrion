//
//  RepositoryDetail.swift
//  Portfolio
//
//  Created by Raymond Brion on 9/28/15.
//  Copyright © 2015 Raymond Brion. All rights reserved.
//

import Foundation
import UIKit

class RepositoryDetail: AboutMeDetail
{
  var sourceName: String
  var repositoryUrl: NSURL
  var value: String
  var image: UIImage
  var actionType: AboutMeDetailAction
  var displayText: String
  {
      return sourceName + ": " + repositoryUrl.absoluteString
  }
  
  init (sourceName: String, repositoryUrl: NSURL, image: UIImage)
  {
    self.sourceName = sourceName
    self.repositoryUrl = repositoryUrl
    self.image = image
    self.actionType = .ExternalWeb
    self.value = repositoryUrl.absoluteString
  }
}
