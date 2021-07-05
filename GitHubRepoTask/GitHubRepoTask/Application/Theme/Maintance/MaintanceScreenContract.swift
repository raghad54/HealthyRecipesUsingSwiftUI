//
//  EmptyScreenContract.swift
//  geoshield
//
//  Created by Mabdu on 08/04/2021.
//  Copyright © 2021 com.Rowaad. All rights reserved.
//

import Foundation
import UIKit
protocol MaintanceScreenContract: AnyObject {
    
}

extension MaintanceScreenContract where Self: BaseController {
    func showMaintanceScreen(for top: CGFloat = 0) {
        hideMaintanceScreen()
        maintanceScreen = MaintanceScreen()
        maintanceScreen.container.backgroundColor = self.view.backgroundColor
        self.view.addSubview(maintanceScreen)
        maintanceScreen.addTopConstraint(toView: view, constant: top)
        maintanceScreen.addLeadingConstraint(toView: view)
        maintanceScreen.addTrailingConstraint(toView: view)
        maintanceScreen.addBottomConstraint(toView: view, constant: 0)
    }
    func hideMaintanceScreen() {
        if maintanceScreen != nil && maintanceScreen.superview != nil {
            maintanceScreen.removeFromSuperview()
        }
    }
}
