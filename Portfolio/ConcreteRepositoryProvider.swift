//
//  ConcreteRepositoryProvider.swift
//  Portfolio
//
//  Created by Raymond Brion on 9/28/15.
//  Copyright © 2015 Raymond Brion. All rights reserved.
//

import Foundation
import UIKit

class ConcreteRepositoryProvider: RepositoryProvider
{
  func getRepositories() -> Array<RepositoryDetail>
  {
    let githubUrl = NSURL(string: "https://github.com/rbryan06/")!
    let githubRepo
      = RepositoryDetail(sourceName: "GitHub",
                      repositoryUrl: githubUrl,
                              image: UIImage(named:"github")!)
    githubRepo.actionType = .ExternalWeb
    
    let bitbucketUrl = NSURL(string: "https://bitbucket.org/rbryan06/")!
    let bitbucketRepo
      = RepositoryDetail(sourceName: "Bitbucket",
                      repositoryUrl: bitbucketUrl,
                              image: UIImage(named:"bitbucket")!)
    bitbucketRepo.actionType = .ExternalWeb
    
    return Array(arrayLiteral: githubRepo, bitbucketRepo)
  }
}