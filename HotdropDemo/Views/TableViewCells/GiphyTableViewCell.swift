//
//  GiphyTableViewCell.swift
//  HotdropDemo
//
//  Created by Kushboo Patel on 6/21/22.
//

import UIKit
import SDWebImage
import FLAnimatedImage

class GiphyTableViewCell: UITableViewCell {

    @IBOutlet weak var giphyimage: FLAnimatedImageView!{
    didSet{
        giphyimage.isUserInteractionEnabled  = true
        // Initialize Tap Gesture Recognizer
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onclick_image(_:)))

        // Add Tap Gesture Recognizer
        giphyimage.addGestureRecognizer(tapGestureRecognizer)
    }}
    @IBOutlet weak var imagetitle : UILabel!
    @IBOutlet weak var showdetails :  UIButton!
    
    var giphydata : Datum? {
        didSet {
            giphyimage.sd_setImage(with: URL(string:giphydata?.url ?? ""), placeholderImage: nil)
            imagetitle.text = giphydata?.title
        }
    }
    var delegate: PerformSegueFromGiphy!
    var delegateimage : Viewgiphyinfullscreen!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func onclick_informationbutton(_ sender: UIButton) {
       
        guard let delegate = delegate else { return }
        delegate.performSegueFromGiphy(giphydata: giphydata!)
    }
    @IBAction func onclick_image(_ sender: UITapGestureRecognizer) {
        print("image pressed")
        
      
        guard let delegate = delegateimage else { return }
        delegate.Viewgiphyinfullscreen(imageurl: giphydata?.images?.original.url ?? "")
    }

}
