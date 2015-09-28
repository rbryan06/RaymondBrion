//
//  AboutMeDetailsTableViewController.swift
//  Portfolio
//
//  Created by Raymond Brion on 9/28/15.
//  Copyright © 2015 Raymond Brion. All rights reserved.
//

import UIKit

protocol AboutMeDetailsTableViewDelegate: class
{
  func detailsTableViewController(controller: AboutMeDetailsTableViewController,
                      didSelectDetail detail: AboutMeDetail?)
}

class AboutMeDetailsTableViewController: UITableViewController
{
  let reuseIdentifier = "aboutMeDetailCell"
  
  var repositoryProvider: RepositoryProvider!
  var contactDetailsProvider: ContactDetailsProvider!
  
  weak var delegate: AboutMeDetailsTableViewDelegate?
  
  private var contactDetails = Array<ContactDetail>()
  private var repositories = Array<RepositoryDetail>()
  
  // MARK: - View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    
    self.clearsSelectionOnViewWillAppear = false
    
    fetchItems()
  }
  
  // MARK: Fetch logic
  
  func fetchItems()
  {
    fetchContactDetails()
    fetchRepositories()
  }
  
  func fetchRepositories()
  {
    repositories = repositoryProvider.getRepositories()
  }
  
  func fetchContactDetails()
  {
    contactDetails = contactDetailsProvider.getContactDetails();
  }
  
  // MARK: - Table view data source methods
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int
  {
    return 2;
  }
  
  override func tableView(tableView: UITableView,
      numberOfRowsInSection section: Int) -> Int
  {
    var count = 0
    if (section == 0)
    {
      count = contactDetails.count
    }
    else if (section == 1)
    {
      count = repositories.count
    }
    return count;
  }
  
  override func tableView(tableView: UITableView,
    cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
  {
    let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier)
      as! AboutMeDetailTableViewCell
    
    /* Set the details based from our provider content */
    if (indexPath.section == 0)
    {
      cell.aboutMeDetail = contactDetails[indexPath.row]
    }
    else if (indexPath.section == 1)
    {
      cell.aboutMeDetail = repositories[indexPath.row]
    }
    return cell;
  }
  
  // MARK: - Table view delegate methods
  
  override func tableView(           tableView: UITableView,
             didSelectRowAtIndexPath indexPath: NSIndexPath)
  {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    
    /* Inform the delegate that a about me details has been selected */
    var aboutMeDetail: AboutMeDetail?
    
    if (indexPath.section == 0)
    {
      aboutMeDetail = contactDetails[indexPath.row]
    }
    else if (indexPath.section == 1)
    {
      aboutMeDetail = repositories[indexPath.row]
    }
    delegate?.detailsTableViewController(self, didSelectDetail: aboutMeDetail)
  }
}
