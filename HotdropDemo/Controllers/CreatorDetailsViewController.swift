//
//  CreatorDetailsViewController.swift
//  HotdropDemo
//
//  Created by Kushboo Patel on 6/22/22.
//

import UIKit
import SDWebImage
import FLAnimatedImage

class CreatorDetailsViewController: UIViewController {

    @IBOutlet weak var bannerimage : UIImageView!
    @IBOutlet weak var profileimage : UIImageView!
    @IBOutlet weak var creatorname : UILabel!
    @IBOutlet weak var userDescription: UITextView!
    var selectedgiphy : Datum?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    //MARK: Setup uielements
    func setupUI()
    {
        bannerimage.sd_setImage(with: URL(string:selectedgiphy?.user?.bannerURL ?? "N/A" ), placeholderImage: nil)
        
        profileimage.sd_setImage(with: URL(string: selectedgiphy?.user?.avatarURL ?? ""), placeholderImage: UIImage(named: ""))
        creatorname.text = selectedgiphy?.user?.username
        userDescription.text = selectedgiphy?.user?.userDescription
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
