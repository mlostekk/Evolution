//
//  AppDelegate.swift
//  Evolution macOS
//
//  Created by Martin Mlostek on 16.05.19.
//  Copyright © 2019 Nomad5. All rights reserved.
//

import Cocoa

class MacApplication: NSApplication {
    
    let strongDelegate = MacAppDelegate()
    
    override init() {
        super.init()
        self.delegate = strongDelegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

@NSApplicationMain
class MacAppDelegate: NSObject, NSApplicationDelegate {

    var mainWindow: NSWindow?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let mainMenu = NSMenu()
        let mainMenuFileItem = NSMenuItem(title: "File", action: nil, keyEquivalent: "")
        let fileMenu = NSMenu(title: "File")
        fileMenu.addItem(withTitle: "New...", action: nil, keyEquivalent: "n")
        mainMenuFileItem.submenu = fileMenu
        
        mainMenu.addItem(mainMenuFileItem)
        
        NSApp.mainMenu = mainMenu
        
        let window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 800, height: 600),
                              styleMask: [.titled, .closable, .resizable, .miniaturizable],
                              backing: NSWindow.BackingStoreType.buffered, defer: false)
        window.orderFrontRegardless()
        window.title = "Hello World"
        window.contentViewController = AppViewController()
        self.mainWindow = window
        
        NSApp.activate(ignoringOtherApps: true)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }


}

