//
//  AboutMeViewController.swift
//  Portfolio
//
//  Created by Raymond Brion on 9/28/15.
//  Copyright © 2015 Raymond Brion. All rights reserved.
//

import UIKit
import MessageUI
import ChameleonFramework

class AboutMeViewController: UIViewController,
                             AboutMeDetailsTableViewDelegate,
                             MFMailComposeViewControllerDelegate
{
  let kEmbedDetailTableViewSegueId = "kEmbedDetailTableView"
  
  @IBOutlet weak var frostedImage: UIImageView!
  
  // MARK: - View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    
    /* Add frosted blur effect to our background image */
    
    self.frostedImage.image = UIImage(named: "avatar")
    
    self.frostedImage.backgroundColor = UIColor.clearColor()
    
    let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
    let blurEffectView = UIVisualEffectView(effect: blurEffect)
    
    blurEffectView.frame = self.frostedImage.bounds
    blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
    
    self.frostedImage.addSubview(blurEffectView)
    
    self.setStatusBarStyle(UIStatusBarStyleContrast)
  }
  
  // MARK: - Navigation
  
  override func prepareForSegue(segue: UIStoryboardSegue,
                               sender: AnyObject?)
  {
    /* Attach the dependencies for the AboutMeDetailsTableViewController */
    if (segue.identifier == kEmbedDetailTableViewSegueId)
    {
      let controller
        = segue.destinationViewController as! AboutMeDetailsTableViewController
      
      controller.contactDetailsProvider = ConcreteContactDetailsProvider()
      controller.repositoryProvider = ConcreteRepositoryProvider()
      controller.delegate = self
    }
  }
  
  // MARK: - AboutMeDetailsTableViewDelegate methods
  
  func detailsTableViewController(controller: AboutMeDetailsTableViewController,
                      didSelectDetail detail: AboutMeDetail?)
  {
    /* Try to handle the selected detail based on their actions provided */
    if let aboutMeDetail = detail
    {
      switch aboutMeDetail.actionType
      {
        case .ExternalWeb:
          UIApplication.sharedApplication()
            .openURL(NSURL(string: aboutMeDetail.value)!)
        case .Phone:
          let phoneNumberString = "tel://" + aboutMeDetail.value
          UIApplication.sharedApplication()
            .openURL(NSURL(string: phoneNumberString)!)
        case .Skype:
          let skypeString = "skype:" + aboutMeDetail.value + "?call"
          UIApplication.sharedApplication()
            .openURL(NSURL(string: skypeString)!)
        case .Email:
          let mailComposeViewController
            = setupMailComposeViewController(aboutMeDetail.value)
          if MFMailComposeViewController.canSendMail()
          {
            self.presentViewController(mailComposeViewController,
                                                        animated: true,
                                                      completion: nil)
          }
      }
    }
  }
  
  // MARK: - MFMailComposeViewControllerDelegate methods
  func mailComposeController(controller: MFMailComposeViewController,
             didFinishWithResult result: MFMailComposeResult,
                                  error: NSError?)
  {
    controller.dismissViewControllerAnimated(true, completion: nil)
  }
  
  // MARK: - Helper methods
  
  func setupMailComposeViewController(email: String) -> MFMailComposeViewController
  {
    let mailComposeViewController = MFMailComposeViewController()
    mailComposeViewController.mailComposeDelegate = self
    
    mailComposeViewController.setToRecipients([email])
    
    return mailComposeViewController
  }
  
}
