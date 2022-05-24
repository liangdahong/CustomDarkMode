//
//  Created by liangdahong on 2022/5/23.
//

import UIKit

extension UIColor {
    static var label: UIColor { DarkModeManager.shared.currentMode == .light ? .black : .white }
    static var background: UIColor { DarkModeManager.shared.currentMode == .light ? .white : .black }
}
