//
//  ConcreteContactDetailsProvider.swift
//  Portfolio
//
//  Created by Raymond Brion on 9/28/15.
//  Copyright © 2015 Raymond Brion. All rights reserved.
//

import Foundation
import UIKit

class ConcreteContactDetailsProvider: ContactDetailsProvider
{
  func getContactDetails() -> Array<ContactDetail>
  {
    let emailContact
      = ContactDetail(contactLabel: "E-mail",
                      contactValue: "rbryan.brion@gmail.com",
                             image: UIImage(named:"email")!)
    emailContact.actionType = .Email
    
    let skypeContact
      = ContactDetail(contactLabel: "Skype",
                      contactValue: "rbryan06",
                             image: UIImage(named:"skype")!)
    skypeContact.actionType = .Skype
    
    let phoneContact
      = ContactDetail(contactLabel: "Phone",
                      contactValue: "+639088601631",
                             image: UIImage(named:"phone")!)
    phoneContact.actionType = .Phone
    
    return Array(arrayLiteral: emailContact, skypeContact, phoneContact)
  }
}