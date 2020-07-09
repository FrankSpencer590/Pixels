//
//  AppDelegate.swift
//  Pixels
//
//  Created by Samuel Miller on 08/07/2020.
//

import UIKit
import CloudKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let container = CKContainer.default()
        let publicDatabase = container.publicCloudDatabase
        let query = CKQuery(recordType: "square", predicate: NSPredicate(value: true))
        
        let group = DispatchGroup()
        group.enter()
        
        DispatchQueue.main.async {
            publicDatabase.perform(query, inZoneWith: nil) { (record, error) in
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    Global.data.pixels = []
                    Global.data.grid = [[]]
                    for record: CKRecord in record! {
                        let row: Int = record.value(forKey: "row") as! Int
                        let column: Int = record.value(forKey: "column") as! Int
                        let colour: Int = record.value(forKey: "colour") as! Int
                        let id: Int = record.value(forKey: "id") as! Int
                        
                        let pixel = Pixel()
                        pixel.column = column
                        pixel.row = row
                        pixel.colour = colour
                        pixel.id = id
                        
                        Global.data.pixels.append(pixel)
                    }
                    for i in Global.data.pixels {
                        Global.data.grid[i.row!].insert(i.colour!, at: i.column!)
                    }
                }
                
                
                group.leave()
                
            }
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }


}

