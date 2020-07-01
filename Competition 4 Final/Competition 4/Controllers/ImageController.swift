
import UIKit

class ImageController: UIViewController {
    @IBOutlet weak var imv: UIImageView!
    var tempImage:UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        imv.image = tempImage
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
