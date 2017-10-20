//
//  ConfigurationManager.swift
//  KVOPractice
//
//  Created by Jon Olivet on 7/17/17.
//  Copyright © 2017 Jon Olivet. All rights reserved.
//

import UIKit

class ConfigurationManager: NSObject {
  
  var configuration: Configuration
  
  lazy private var dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy:MM:dd HH:mm:ss"
    return dateFormatter
  }()
  
  var createdAt: String {
    return dateFormatter.string(from: configuration.createdAt)
  }
  
  var updatedAt: String {
    return dateFormatter.string(from: configuration.updatedAt)
  }
  
  // MARK: - Initialization
  init(withConfiguration configuration: Configuration){
    self.configuration = configuration
    super.init()
  }
  
  // MARK: - Public Interface
  func updateConfiguration(){
    configuration.updatedAt = Date()
  }
  
}
