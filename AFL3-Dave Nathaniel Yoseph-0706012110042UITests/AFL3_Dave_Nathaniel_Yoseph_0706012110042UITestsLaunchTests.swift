//
//  AFL3_Dave_Nathaniel_Yoseph_0706012110042UITestsLaunchTests.swift
//  AFL3-Dave Nathaniel Yoseph-0706012110042UITests
//
//  Created by MacBook Pro on 24/04/23.
//

import XCTest

final class AFL3_Dave_Nathaniel_Yoseph_0706012110042UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
