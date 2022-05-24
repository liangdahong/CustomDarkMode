//
//  Created by liangdahong on 2022/5/23.
//

import UIKit

extension UIImage {
    static var home: UIImage? { DarkModeManager.shared.currentMode == .light ? .init(named: "light") : .init(named: "dark") }
}
