//
//  GiphyViewController.swift
//  HotdropDemo
//
//  Created by Kushboo Patel on 6/21/22.
//

import UIKit
import FLAnimatedImage

class GiphyViewController: UIViewController, UITableViewDelegate,PerformSegueFromGiphy,Viewgiphyinfullscreen{
   
    @IBOutlet weak var TableView: UITableView!
    
    private var giphyViewModel : GiphyViewModel!
    
    private var dataSource : GiphyTableViewDatasource<GiphyTableViewCell,Datum>!
    
    private var Requesttype : String?
    
    private var selectedgiphy : Datum?

    override func viewDidLoad() {
        super.viewDidLoad()
        Requesttype = "gif"
        callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate(){
       
        self.giphyViewModel =  GiphyViewModel()
        
        self.giphyViewModel.bindEmployeeViewModelToController = {
            
            self.updateDataSource()
        }
    }
    
    func updateDataSource(){
       
        self.dataSource = GiphyTableViewDatasource(cellIdentifier: "GiphyTableViewCell", items: self.giphyViewModel.giphydata.data, configureCell: {(cell, gvm) in // make cell here
            cell.delegate = self
            cell.delegateimage = self
            cell.giphydata = gvm
            cell.imagetitle.text = gvm.title
            cell.giphyimage.sd_setImage(with: URL(string:gvm.images?.original.url ?? "N/A" ), placeholderImage: nil)
         })
        
        DispatchQueue.main.async {
            self.TableView.dataSource = self.dataSource
            self.TableView.reloadData()
        }
    }
    
    //MARK: IBAction
    
    @IBAction func segmentdidchange(_ sender : UISegmentedControl)
    {
        if Requesttype == "gif"
        {
        Requesttype = "stickies"
        }
        else
        {
            Requesttype = "gif"
        }
        self.giphyViewModel.callFuncToGetGiphyData(limit: "25", type: Requesttype ?? "")
        self.giphyViewModel.bindEmployeeViewModelToController = {
            
            self.updateDataSource()
        }
    }

    //MARK: Perform Segue Delegate
    func performSegueFromGiphy(giphydata: Datum)
    {
        selectedgiphy = giphydata
        self.performSegue(withIdentifier: "segueFromGiphytoCreatordetails", sender: self)
    }
    
    //MARK: View Giphy in full screen
    func Viewgiphyinfullscreen(imageurl: String) {
     
      //  let imageView = sender.view as! UIImageView
        let newImageView = FLAnimatedImageView()
        newImageView.sd_setImage(with: URL(string:imageurl ), placeholderImage: nil)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleToFill
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }

    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
    }
    
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "segueFromGiphytoCreatordetails"
        {
            let vc = segue.destination as! CreatorDetailsViewController
            vc.selectedgiphy = selectedgiphy
        }
    }
    

}
