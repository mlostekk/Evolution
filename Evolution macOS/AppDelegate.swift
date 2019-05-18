//
//  AppDelegate.swift
//  Evolution macOS
//
//  Created by Martin Mlostek on 16.05.19.
//  Copyright © 2019 Nomad5. All rights reserved.
//

import Cocoa

/// The main entry point of the application
class MacApplication: NSApplication {

    /// Hold on to the strong deletage
    let strongDelegate = MacAppDelegate()

    override init() {
        super.init()
        self.delegate = strongDelegate
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

/// The main delegate for the application
@NSApplicationMain
class MacAppDelegate: NSObject, NSApplicationDelegate {

    /// The main DI container
    let assembler:  AppAssembler = AppAssembler()

    /// The main window
    var mainWindow: NSWindow?

    /// Ready to start
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // build main menu
        let mainMenu         = NSMenu()
        let mainMenuFileItem = NSMenuItem(title: "File", action: nil, keyEquivalent: "")
        let fileMenu         = NSMenu(title: "File")
        fileMenu.addItem(withTitle: "New...", action: nil, keyEquivalent: "n")
        mainMenuFileItem.submenu = fileMenu
        mainMenu.addItem(mainMenuFileItem)
        NSApp.mainMenu = mainMenu

        // create window
        let window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 800, height: 600),
                              styleMask: [.titled, .closable, .resizable, .miniaturizable],
                              backing: NSWindow.BackingStoreType.buffered,
                              defer: false)
        window.orderFrontRegardless()
        window.title = "Hello World"
        window.contentViewController = AppViewController(assembler: assembler)
        self.mainWindow = window

        // activate app
        NSApp.activate(ignoringOtherApps: true)
    }

    /// Shutting down
    func applicationWillTerminate(_ aNotification: Notification) {
    }

    /// Close app after closing last window
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }

}
