//
//  RepositoryProvider.swift
//  Portfolio
//
//  Created by Raymond Brion on 9/28/15.
//  Copyright © 2015 Raymond Brion. All rights reserved.
//

import Foundation

protocol RepositoryProvider
{
  /**
      Returns all the available repositories.
  
      - returns: Array All available repositories
  */
  func getRepositories() -> Array<RepositoryDetail>
}