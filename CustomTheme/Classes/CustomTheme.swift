//
//  Created by liangdahong on 2022/5/23.
//

import Foundation

public protocol CustomTheme: AnyObject { }

public extension CustomTheme {
    
    @discardableResult
    func theme(_ block: @escaping ((_ view: Self) -> ())) -> Self {
        CustomThemeService.shared.config(self, block: block)
        return self
    }
}

extension NSObject: CustomTheme { }
