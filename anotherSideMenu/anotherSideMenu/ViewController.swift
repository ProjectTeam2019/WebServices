
import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,CAAnimationDelegate
{
    var tbl = UITableView()
    var hidemenu:Bool = true
    let dicMembers = [["name":"Home","image":"home.png"],
        ["name":"More","image":"more.png"]]
    
    
   override func viewDidLoad()
   {
        super.viewDidLoad()
    
    tbl = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: self.view.frame.size.height), style: .plain)
    tbl.backgroundColor = UIColor.lightGray
    tbl.separatorStyle = .none
    tbl.dataSource = self
    tbl.delegate = self
    let right = UISwipeGestureRecognizer(target: self, action: #selector(self.showmenu))
    let left = UISwipeGestureRecognizer(target: self, action: #selector(self.hide))
    left.direction = .left
    right.direction = .right
    self.view.addGestureRecognizer(right)
    self.view.addGestureRecognizer(left)
    self.view.addSubview(tbl)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        hide()
    }

    @IBAction func btn(_ sender: Any)
    {
        if hidemenu == true
        {
            showmenu()
        }
        else
        {
            hide()
        }
    }
    
    @objc func hide()
    {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.5)
        UIView.setAnimationDelegate(self)
        tbl.frame = CGRect(x: 0, y: 0, width: 0, height: self.view.frame.size.height)
        UIView.commitAnimations()
        hidemenu = true
    }
    
     @objc func showmenu()
     {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.5)
        UIView.setAnimationDelegate(self)
        tbl.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width/1.3, height: self.view.frame.size.height)
        UIView.commitAnimations()
        hidemenu = false
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        /*tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.row == 0
        {
            cell.textLabel?.text = "Home"
            cell.imageView?.image = UIImage(named: "home.png")
        }
        if indexPath.row == 1
        {
            cell.textLabel?.text = "More"
        }*/
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "menucell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "menucell", for: indexPath)
        let dic = dicMembers[indexPath.row]
        
        cell.textLabel?.text = dic["name"]
        cell.imageView?.image  = UIImage(named: dic["image"]!)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0
        {
            /*GIDSignIn.sharedInstance().signOut()
            let diff = UserDefaults.standard
            diff.removeObject(forKey: "Username")*/
            let stb = self.storyboard?.instantiateViewController(withIdentifier: "home")
            self.navigationController?.pushViewController(stb!, animated: true)
        }
        if indexPath.row == 1
        {
            let stb = self.storyboard?.instantiateViewController(withIdentifier: "more")
            self.navigationController?.pushViewController(stb!, animated: true)
        }
        if indexPath.row == 3
        {
            let stb = self.storyboard?.instantiateViewController(withIdentifier: "more")
            self.navigationController?.pushViewController(stb!, animated: true)
        }
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.5)
        UIView.setAnimationDelegate(self)
        tbl.frame = CGRect(x: 0, y: 0, width: 0, height: self.view.frame.size.height)
        UIView.commitAnimations()
    }
}
