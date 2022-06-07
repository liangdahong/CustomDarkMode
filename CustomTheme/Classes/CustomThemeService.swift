//    MIT License
//
//    Copyright (c) 2022 梁大红 https://liangdahong.com
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//    SOFTWARE.

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
    
    @discardableResult
    func config<View: AnyObject, T>(_ view: View, block: @escaping ((_ view: View) throws -> T)) rethrows -> T {
        let weakWrapper = WeakWrapper(value: view as AnyObject, block: { view in
            if let tmpView = view as? View {
                _ = try? block(tmpView)
            }
        })
        weakWrappers.append(weakWrapper)
        return try block(view)
    }
}

fileprivate extension CustomThemeService {
    
    struct WeakWrapper {
        weak var value: AnyObject?
        let block: ((_ view: AnyObject) -> ())
    }
}
