//
//  AppDelegate.swift
//  FMYCS
//
//  Created by xuewu.long on 16/12/1.
//  Copyright © 2016年 fmylove. All rights reserved.
//
//https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Types.html


import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        #if false

        let testVC      = CSTestViewController.init()
        let navTest     = UINavigationController.init(rootViewController: testVC)
        navTest.title   = "Test"
        let tabBar      = UITabBarController.init()
        
        
        
        
        let ocVC    = CSOCViewController.init()
        let navOc   = UINavigationController.init(rootViewController: ocVC)
        navOc.title = "OCVC";
        
        
        
        
        tabBar.addChildViewController(navTest)
        tabBar.addChildViewController(navOc)
        
        
        
        self.window?.rootViewController = tabBar
           
        #endif
    
        
        let gabrielle   = FMYPerson(name: "Gabrielle")
        let jim         = FMYPerson(name: "Jim")
        let yuanyuan    = FMYPerson(name: "Yuanyuan")
        gabrielle.friends       = [jim, yuanyuan]
        gabrielle.bestFriend    = yuanyuan
        
        print(#keyPath(FMYPerson.name))
        
        // "name"
        gabrielle.value(forKey: #keyPath(FMYPerson.name))
        // "Gabrielle"
        print(#keyPath(FMYPerson.bestFriend.name))
        // "bestFriend.name"
        gabrielle.value(forKeyPath: #keyPath(FMYPerson.bestFriend.name))
        // "Yuanyuan"
        print(#keyPath(FMYPerson.friends.name))
        // "friends.name"
        gabrielle.value(forKeyPath: #keyPath(FMYPerson.friends.name))
        // ["Yuanyuan", "Jim"]
        
        
        var  myPersonClass: AnyClass? = NSClassFromString("CSOCViewController")
        print(myPersonClass ?? "");//
        myPersonClass = NSClassFromString("FMYCS.CSOCViewController")
        print(myPersonClass ?? "");

        myPersonClass = NSClassFromString("FMYPerson")
        print(myPersonClass ?? "");
        
        myPersonClass = NSClassFromString("FMYCS.FMYPerson")
        print(myPersonClass ?? "");

        myPersonClass = NSClassFromString("UIButton")
        print(myPersonClass ?? "");

        myPersonClass = NSClassFromString("FMYCS.UIButton")
        print(myPersonClass ?? "");

        let someInstance: SomeBaseClass = SomeSubClass()
        // The compile-time type of someInstance is SomeBaseClass,
        // and the runtime type of someInstance is SomeSubClass
        type(of: someInstance).printClassName()
        // Prints "SomeSubClass”
        
        type(of:someInstance).printClassName()
    
        let path = diskCachePath(nameSpace: "down_files")
        print(path)




        let mySessionM:FMYURLSessionManager = FMYURLSessionManager(configuration: nil)
        let mySessionM2:FMYURLSessionManager = FMYURLSessionManager()

        let httpSession:FMYHTTPSessionManager = FMYHTTPSessionManager(url: URL(string: url_webxmlBase), configuration: nil)



        let task = httpSession.net(method: nil, parameters: ["key":"value","key2":"value2","key2":"value3"], success:{(dataTask, object) -> Void in
            print(object)
            print(dataTask ?? "empty")
            let dataStr =  String(data: object as! Data, encoding: .utf8)
            print(dataTask)

        }, failure: {(dataTask, error) -> Void in
            print(error)
            print(dataTask ?? "empty    ")

        })
        
        
        
        print(task)
        

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

