//
//  ViewController.swift
//  timer
//
//  Created by ShibayamaKentaro on 2020/01/26.
//  Copyright © 2020 ShibayamaKentaro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer: Timer!
    
    var Imageindex: Int = 0
    
    @IBOutlet var Image: UIImageView!
    
    @IBAction func startandstop(_ sender: Any) {
        // 再生ボタンを押すとタイマー作成、始動
        change2.isHidden = true
        return2.isHidden = true
        change2.isEnabled = false
        return2.isEnabled = false
        startandstoplabel.setTitle("停止", for: .normal)
        if self.timer == nil { self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        }
        else {
            self.timer.invalidate()
            self.timer = nil
            change2.isHidden = false
            return2.isHidden = false
            change2.isEnabled = true
            return2.isEnabled = true
            startandstoplabel.setTitle("再生", for: .normal)
        }
    }
    
    @IBOutlet var startandstoplabel: UIButton!
    
    @IBAction func change(_ sender: Any) {
        if Imageindex != 2 {
            Imageindex += 1
        }
        else {
            Imageindex = 0
        }
        Image.image = imagephotos[Imageindex]
    }
    
    @IBOutlet var change2: UIButton!
    
    @IBAction func `return`(_ sender: Any) {
        if Imageindex != 0 {
            Imageindex -= 1
        }
        else {
            Imageindex = 2
        }
        Image.image = imagephotos[Imageindex]
    }
    
    @IBOutlet var return2: UIButton!
    
    let photo = UIImage(named: "eto_nezumi_kakizome")
    let photo2 = UIImage(named: "eto_nezumi_kamifubuki")
    let photo3 = UIImage(named: "pyoko_kotatsu_kagamimochi-2")
    lazy var imagephotos: [UIImage] = [photo!, photo2!, photo3!]
    
    @IBAction func tapAction(_ sender: Any) {
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Image.image = imagephotos[Imageindex]
    }
    
    @objc func updateTimer(_ timer: Timer) {
        if Imageindex != 2 {
            self.Imageindex += 1
        }
        else { self.Imageindex = 0
        }
        Image.image = imagephotos[Imageindex]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let bigImageViewController: BigImageViewController = segue.destination as! BigImageViewController
        
        if timer != nil {
            self.timer.invalidate()
            self.timer = nil
            change2.isHidden = false
            return2.isHidden = false
            change2.isEnabled = true
            return2.isEnabled = true
            startandstoplabel.setTitle("再生", for: .normal)
        }
        
        bigImageViewController.BigImageindex = Imageindex
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {}
}
