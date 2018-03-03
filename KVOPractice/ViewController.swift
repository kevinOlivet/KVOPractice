//
//  ViewController.swift
//  KVOPractice
//
//  Created by Jon Olivet on 7/17/17.
//  Copyright © 2017 Jon Olivet. All rights reserved.
//

import UIKit

enum whichWay {
  case oldWay
  case newWay
}

class ViewController: UIViewController {
  
  // Use type to specify the Swift 3 way or the Swift 4 way
  let type: whichWay = .oldWay
  
  @IBOutlet weak var timeLabel: UILabel!
  
  let configurationManager = ConfigurationManager(withConfiguration: Configuration())
  
  // Needed for newWay
  var token: NSKeyValueObservation? = nil
  
  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    switch type {
    case .oldWay:
      addObserver(self, forKeyPath: #keyPath(configurationManager.configuration.updatedAt), options: [.old, .new, .initial], context: nil)
    case .newWay:
      startObserving()
    }
  }
  
  // MARK: - Actions
  @IBAction func updateConfiguration(_ sender: UIButton) {
    configurationManager.updateConfiguration()
  }
  
  // MARK: - Key-Value Observing
  // Old way
  override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    switch type {
    case .oldWay:
      if keyPath == #keyPath(configurationManager.configuration.updatedAt) {
        // Update Time Label
        timeLabel.text = configurationManager.updatedAt
      }
    case .newWay:
      // Not needed
      break
    }
  }
  
  // New way
  func startObserving() {
    token = configurationManager.observe(\.configuration.updatedAt, options: [.old, .new, .initial], changeHandler: { (object, change) in
      self.timeLabel.text = object.updatedAt
    })
  }
  
  // MARK: - Deinitialization
  deinit {
    switch type {
    case .oldWay:
      removeObserver(self, forKeyPath: #keyPath(configurationManager.configuration.updatedAt))
    case .newWay:
      // Not needed
      break
    }
  }
  
}

