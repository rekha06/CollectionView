//
//  ViewController.swift
//  CollectionViewExample
//
//  Created by rekha on 27/08/19.
//  Copyright © 2019 . All rights reserved.
//

import UIKit
import AVKit
import WebKit

class ViewController: UIViewController{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
   
    func fetchFirstFrameOf(Name : String) -> UIImage? {
        
        if let filePath = Bundle.main.path(forResource: Name, ofType: ".mp4") {
            let filePathURL = NSURL.fileURL(withPath: filePath)
            
            let asset = AVURLAsset(url: filePathURL, options: nil)
            let imgGenerator = AVAssetImageGenerator(asset: asset)
            imgGenerator.appliesPreferredTrackTransform = false
            
            do {
                let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(value: 5, timescale: 1), actualTime: nil)
                let thumbnail = UIImage(cgImage: cgImage)
                
                return thumbnail
                
            } catch let error {
                print("*** Error generating thumbnail: \(error)")
                return nil
            }
        }
        
        return nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let path = Bundle.main.path(forResource: "video", ofType: ".mp4")
        
        print(path ?? "No path")
        
        if segue.identifier == "PlayVideo"  {

            if let filePath = Bundle.main.path(forResource: "video", ofType: ".mp4") {
                let filePathURL = NSURL.fileURL(withPath: filePath)
                
                let destination = segue.destination as! AVPlayerViewController
                
                destination.player = AVPlayer(url: filePathURL)
                
                
            }else{
                
            }
            
            
        }
        
        //ShowVideo
        
        
        
    }


    override func viewDidLoad() {
        
        super.viewDidLoad()
        collectionView.register(ImageCollectionViewCell.nib, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        collectionView.register(UINib(nibName: "PdfCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PdfCollectionViewCell")
        collectionView.register(VideoCollectionViewCell.nib, forCellWithReuseIdentifier: VideoCollectionViewCell.identifier)
        // Do any additional setup after loading the view.
    }


}

extension ViewController :UICollectionViewDelegate,UICollectionViewDataSource{
 
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell
            cell?.imageView.image = UIImage.init(named: "pic")
            return cell!
            
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoCollectionViewCell.identifier, for: indexPath) as? VideoCollectionViewCell
            cell?.VideoImageView.image = fetchFirstFrameOf(Name :"video")
            return cell!
        case 2:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PdfCollectionViewCell.identifier, for: indexPath) as? PdfCollectionViewCell
            let pdfLoc = NSURL(fileURLWithPath:Bundle.main.path(forResource: "Economics_HL", ofType:"pdf")!)
            let request = URLRequest(url : pdfLoc as URL)
            cell?.webview.load(request)
            return cell!

       
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PdfCollectionViewCell.identifier, for: indexPath) as? PdfCollectionViewCell
            let pdfLoc = NSURL(fileURLWithPath:Bundle.main.path(forResource: "demo", ofType:"docx")!)
            let request = URLRequest(url : pdfLoc as URL)
            cell?.webview.load(request)
         
            return cell!
            
        }
        
 
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        if(indexPath.row == 1){
            
            self.performSegue(withIdentifier: "PlayVideo", sender: indexPath.row)
            
        }
      
    }
    
    
    
}

