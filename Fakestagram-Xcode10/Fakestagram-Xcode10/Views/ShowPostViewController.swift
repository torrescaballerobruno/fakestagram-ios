//
//  PostsViewController.swift
//  Fakestagram-Xcode10
//
//  Created by Bruno Torres on 10/12/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class ShowPostViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var likeCounter: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var commentBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onTapLike(_ sender: Any){
        print("like")
    }

    @IBAction func onTapComment(_ sender: Any){
        print("to comment")
    }
    
    @IBAction func onTapShowComments(_ sender: Any){
        print("to show comments")
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
