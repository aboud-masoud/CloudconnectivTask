
import UIKit
import MBProgressHUD

class PopupManager: NSObject {
    
    class func showProgress(view:UIView){
        MBProgressHUD.showAdded(to: view, animated: true)
    }
    
    class func hideProgress(view:UIView){
        MBProgressHUD.hide(for: view, animated: true)
    }
    
    class func showWarningMessage(message: String) {
        _ = SweetAlert().showAlert(NSLocalizedString("Warning", comment: "Warning"), subTitle: message, style: .warning)
    }
}
