

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor.white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        
        navigationController?.navigationBar.barColor = UIColor.orange
       
        tableView.addScalableCover(with: UIImage(named: "images")!, maxHeight: 100)
        tableView.showsVerticalScrollIndicator = false
        tableView.tableHeaderView = UIView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(didTap))
    }

    
   override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 66
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        return view
    }
    
    
    @objc func didTap(){
         let new = DetailViewController()
         pushToViewController(new, navigationBarBottomLine: true)
    }
    
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.attachToScrollView(tableView)
    }
   
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
   
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }

    

}


extension UIViewController {
    
  public func pushToViewController(_ to:UIViewController,navigationBarBottomLine:Bool = false){
        self.navigationController?.navigationBar.reset()
        self.navigationController?.pushViewController(to, animated: true)
        self.navigationController?.navigationBar.updateAlpha(0)
        if navigationBarBottomLine {
            self.navigationController?.navigationBar.shadowImage = UIImage()
        }
    }
}

