import UIKit

class GalleryController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var imges = [UIImage]()
    var tempImage:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        getPhotos()
    }
    @IBAction func backButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func getPhotos(){
        let url = try! FileManager.default.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
        do{
            let a = try FileManager().contentsOfDirectory(atPath: url.path)
            for img in a{
                let pth = url.appendingPathComponent(img)
                self.imges.append(UIImage(contentsOfFile: pth.path)!)
            }
        }
        catch{
            print("ERROR")
        }
    }
    func deleteFiles(at:Int){
         let url = try! FileManager.default.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
        do{
            var a = try FileManager().contentsOfDirectory(atPath: url.path)

            let pth = url.appendingPathComponent(a[at])
            try FileManager().removeItem(atPath: pth.path)
        }
        catch{
            print("ERROR")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destionationVC = segue.destination as? ImageController
        destionationVC?.tempImage = tempImage!
    }
    
}
extension GalleryController : UITableViewDelegate {}
extension GalleryController  :UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imges.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.imv.image = imges[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view, handler) in
            self.imges.remove(at: indexPath.row)
            self.deleteFiles(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            handler(true)
        }
        
        let config = UISwipeActionsConfiguration(actions: [delete])
        
        
        return config
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tempImage = imges[indexPath.row]
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "show", sender: self)
        }
    }
}
