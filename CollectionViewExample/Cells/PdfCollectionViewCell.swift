//
//  PdfCollectionViewCell.swift
//  CollectionViewExample
//
//  Created by rekha on 27/08/19.
//  Copyright © 2019 Mindlogicx. All rights reserved.
//

import UIKit
import WebKit

class PdfCollectionViewCell: UICollectionViewCell,WKNavigationDelegate{
    
    @IBOutlet weak var webview: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {

        super.awakeFromNib()
          self.webview.navigationDelegate = self
          activityIndicator.startAnimating()
        // Initialization code
    }
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
       activityIndicator.stopAnimating()
        activityIndicator.hidesWhenStopped = true
    }
}
