//
//  Created by liangdahong on 2022/5/23.
//

import UIKit
import CustomTheme

class ViewController: UIViewController {
    
    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        `switch`.theme { view in
            view.isOn = DarkModeManager.shared.currentMode == .dark
        }
        
        view.theme({ view in
            view.backgroundColor = DarkModeManager.shared.currentMode == .light ? .white : .black
        })
        
        titleLabel.theme({ view in
            view.textColor = .label
        })
        
        let label = UILabel()
        label.text = "我的标题"
        label.frame = .init(x: 100, y: 100, width: 100, height: 100)
        view.addSubview(label)
        label.theme { view in
            view.textColor = .label
        }
        
        if navigationController?.viewControllers.count == 1 {
            navigationItem.leftBarButtonItem = .init(title: "OK", style: .done, target: nil, action: nil)
                .theme({ view in
                    view.tintColor = .label
                })
        }
        
        navigationItem.rightBarButtonItem?
            .theme({ view in
                view.tintColor = .label
            })
        
        let imgView = UIImageView()
        imgView.frame = .init(x: 100, y: 300, width: 100, height: 100)
        view.addSubview(imgView)
        imgView.theme { view in
            view.image = .home
        }
    }
    
    @IBAction func switchClick(_ sender: UISwitch) {
        DarkModeManager.shared.currentMode = sender.isOn ? .dark : .light
        CustomThemeService.refresh()
    }
}
