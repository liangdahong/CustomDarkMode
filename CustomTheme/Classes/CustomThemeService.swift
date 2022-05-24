//
//  Created by liangdahong on 2022/5/23.
//

import UIKit

final public class CustomThemeService {
    
    static var shared = CustomThemeService()
    private init() { }
    private var weakWrappers = [WeakWrapper]()
}

public extension CustomThemeService {
    
    static func refresh()  {
        shared.weakWrappers = shared.weakWrappers.filter { $0.value != nil }
        shared.weakWrappers.forEach {
            if let obj = $0.value {
                $0.block(obj)
            }
        }
    }
}

extension CustomThemeService {
    
    func config<View: AnyObject>(_ view: View, block: @escaping ((_ view: View) -> ()))  {
        let weakWrapper = WeakWrapper(value: view as AnyObject, block: { view in
            if let tmpView = view as? View {
                block(tmpView)
            }
        })
        weakWrappers.append(weakWrapper)
        block(view)
    }
}

fileprivate extension CustomThemeService {
    
    struct WeakWrapper {
        weak var value: AnyObject?
        let block: ((_ view: AnyObject) -> ())
    }
}
