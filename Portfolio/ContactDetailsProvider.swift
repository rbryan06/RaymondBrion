//
//  ContactDetailsProvider.swift
//  Portfolio
//
//  Created by Raymond Brion on 9/28/15.
//  Copyright © 2015 Raymond Brion. All rights reserved.
//

import Foundation

protocol ContactDetailsProvider
{
  /**
  Returns all the available contact details.
  
  - returns: Array All available contact details
  */
  func getContactDetails() -> Array<ContactDetail>
}
