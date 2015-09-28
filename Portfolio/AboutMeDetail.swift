//
//  AboutMeDetail.swift
//  Portfolio
//
//  Created by Raymond Brion on 9/28/15.
//  Copyright © 2015 Raymond Brion. All rights reserved.
//

import Foundation
import UIKit

protocol AboutMeDetail
{
  var displayText: String { get }
  var image: UIImage { get set }
  var actionType: AboutMeDetailAction { get set }
  var value: String { get }
}
