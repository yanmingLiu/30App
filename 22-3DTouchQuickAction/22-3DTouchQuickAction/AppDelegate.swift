//
//  AppDelegate.swift
//  22-3DTouchQuickAction
//
//  Created by lym on 2021/4/1.
//

import UIKit

enum ShortcutIdentifier: String {
    case First
    case Second
    case Third

    init?(fullType: String) {
        guard let last = fullType.components(separatedBy: ".").last else {
            return nil
        }
        self.init(rawValue: last)
    }

    var type: String {
        return Bundle.main.bundleIdentifier! + ".\(rawValue)"
    }
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    /*
     定义方式:
        1. 定义静态快速动作（Info.plist 文件添加创建） UIApplicationShortcutItems
        2. 定义动态快速动作（代码创建） application.shortcutItems
     */

    var launchedShortcutItem: UIApplicationShortcutItem?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        let handledShortCutItem = handleShortCutItem(shortcutItem)
        completionHandler(handledShortCutItem)
    }

    // MARK: 处理shortCutItem

    func handleShortCutItem(_ shortcutItem: UIApplicationShortcutItem) -> Bool {
        var handled = false
        guard let _ = ShortcutIdentifier(fullType: shortcutItem.type) else {
            return false
        }
        guard let shortCutType = shortcutItem.type as String? else {
            return false
        }
        let vc = UIViewController()
        switch shortCutType {
        case ShortcutIdentifier.First.type:
            // Handle shortcut 1
            vc.view.backgroundColor = .red
            handled = true
        case ShortcutIdentifier.Second.type:
            // Handle shortcut 2
            vc.view.backgroundColor = .blue
            handled = true
        case ShortcutIdentifier.Third.type:
            // Handle shortcut 3
            vc.view.backgroundColor = .green
            handled = true
        default:
            break
        }

        // Display the selected view controller
        //
        var presentedVC: UIViewController = window!.rootViewController!
        while presentedVC.presentedViewController != nil {
            presentedVC = presentedVC.presentedViewController!
        }
        if !presentedVC.isMember(of: vc.classForCoder) {
            presentedVC.present(vc, animated: true, completion: nil)
        }
        return handled
    }

}
