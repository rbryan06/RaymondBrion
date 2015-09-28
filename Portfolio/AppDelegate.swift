//
//  AppDelegate.swift
//  Portfolio
//
//  Created by Raymond Brion on 9/28/15.
//  Copyright © 2015 Raymond Brion. All rights reserved.
//

import UIKit
import ChameleonFramework

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
  var window: UIWindow?
  
  // MARK: - Application lifecycle
  
  func                 application (application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
  {
    Chameleon.setGlobalThemeUsingPrimaryColor(FlatSkyBlue(),
      withContentStyle: .Contrast)
    
    return true
  }
}

