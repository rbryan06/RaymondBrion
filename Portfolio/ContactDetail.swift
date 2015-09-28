//
//  ContactDetail.swift
//  Portfolio
//
//  Created by Raymond Brion on 9/28/15.
//  Copyright © 2015 Raymond Brion. All rights reserved.
//

import Foundation
import UIKit

class ContactDetail: AboutMeDetail
{
  var contactLabel: String
  var value: String
  var image: UIImage
  var actionType: AboutMeDetailAction
  var displayText: String
  {
    return contactLabel + ": " + value
  }
  
  init (contactLabel: String, contactValue: String, image: UIImage)
  {
    self.contactLabel = contactLabel
    self.value = contactValue
    self.image = image
    self.actionType = .ExternalWeb
  }
}