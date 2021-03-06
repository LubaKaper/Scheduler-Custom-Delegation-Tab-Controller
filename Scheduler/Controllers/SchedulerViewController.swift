//
//  SchedulerViewController.swift
//  Scheduler
//
//  Created by Liubov Kaper  on 1/24/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class SchedulerViewController: UITabBarController {

    
   
      private let dataPersistence = DataPersistence<Event>(filename: "schedules.plist")
      
      // get instances of the two tabs from storyboard
      private lazy var schedulesNavController: UINavigationController = {
        guard let navController = storyboard?.instantiateViewController(identifier: "SchedulesNavController") as? UINavigationController,
          let schedulesListController = navController.viewControllers.first as? ScheduleListController else {
          fatalError("could not load nav controller")
        }
        // set dataPersistence property
        return navController
      }()
      
      // first we get access to the UINavigationController
      // then we access the first view controller
      private lazy var completedNavController: UINavigationController = {
        guard let navController = storyboard?.instantiateViewController(identifier: "CompletedNavController") as? UINavigationController,
          let recentlyCompletedController = navController.viewControllers.first as? CompletedScheduleController else {
            fatalError("could not load nav controller")
        }
        // set dataPersistence property
        return navController
      }()
      
      override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [schedulesNavController]
      }
      
    }
