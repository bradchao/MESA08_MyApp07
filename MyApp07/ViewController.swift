//
//  ViewController.swift
//  MyApp07
//
//  Created by user22 on 2017/9/19.
//  Copyright © 2017年 Brad Big Company. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var sView: UIScrollView!
    
    private let imageView = UIImageView(image: UIImage(named: "iphonex.jpg"))
    
    
    
    @IBAction func changeValue(_ sender: UISlider) {
        print(sender.value)
    }

    @IBAction func switchState(_ sender: UISwitch) {
        
        print(sender.isOn)
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.contentMode = .scaleAspectFit
        sView.addSubview(imageView)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        imageView.frame = sView.bounds
        let size = getImageSizeChange()
        imageView.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        sView.contentSize = imageView.frame.size
        
    }
    
    func getImageSizeChange() -> CGSize {
        
        let wRate = imageView.bounds.size.width / imageView.image!.size.width
        let hRate = imageView.bounds.size.height / imageView.image!.size.height
        let scale = (wRate > hRate) ? hRate : wRate
        
        let imageW = scale * imageView.image!.size.width
        let imageH = scale * imageView.image!.size.height
        return CGSize(width: imageW, height: imageH)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

