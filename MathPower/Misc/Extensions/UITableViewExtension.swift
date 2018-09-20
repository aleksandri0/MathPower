import UIKit

extension UITableView {
    
    func register(_ type: UITableViewCell.Type) {
        let typeName = String(describing: type)
        register(UINib(nibName: typeName, bundle: Bundle.main), forCellReuseIdentifier: typeName)
    }
    
    func dequeueCell<T>(_ type: T.Type) -> T? {
        let typeName = String(describing: type)
        return dequeueReusableCell(withIdentifier: typeName) as? T
    }
    
}
