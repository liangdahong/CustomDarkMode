//
//  DarkModeManager.swift
//  CustomDarkMode_Example
//
//  Created by liangdahong on 2022/5/24.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation

struct DarkModeManager {
    
    var currentMode = Mode.dark
    
    static var shared = Self()
    
    private init() { }
}

extension DarkModeManager {
    
    enum Mode {
        case light
        case dark
    }
}
