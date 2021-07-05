//
//  Initial.swift
//  SupportI
//
//  Created by Mohamed Abdu on 3/20/20.
//  Copyright © 2020 MohamedAbdu. All rights reserved.
//

import Foundation
import UIKit
import Lottie
import NVActivityIndicatorView

var showLoadingMainView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
var animationView = AnimationView()
let indicator = NVActivityIndicatorView(frame: CGRect(x: 100, y: 100, width: 70, height: 70), type: .ballScaleMultiple, color: .green)
var fadedView: UIView?
var refreshControl = UIRefreshControl()

extension UIViewController {

  enum AnimationFiles: String {
    case loading
    case loading1
    case loading2
    case loading3
    case loading4
  }
   
  func startLoading() {
    let view = self.view
    indicator.color = .green
    indicator.translatesAutoresizingMaskIntoConstraints = false
//    refreshControl.beginRefreshing()
//        fadedView = UIView(frame: frame ?? view!.bounds)
//        isTransparent ? (fadedView?.alpha = 0.6) : (fadedView?.alpha = 1)
//        fadedView?.backgroundColor = background == true ? UIColor.white : .clear
//
//        view!.addSubview(fadedView!)
    
    
    view!.addSubview(indicator)
    NSLayoutConstraint.activate([
        indicator.widthAnchor.constraint(equalToConstant: 40),
        indicator.heightAnchor.constraint(equalToConstant: 40),
        indicator.centerXAnchor.constraint(equalTo: view!.centerXAnchor),
        indicator.centerYAnchor.constraint(equalTo: view!.centerYAnchor)
    ])
    indicator.startAnimating()
    
    self.view.isUserInteractionEnabled = false
//    self.startLoading(.loading)
  }
  func startLoading(_ loading: AnimationFiles = .loading) {
    let animation = Animation.named(loading.rawValue)
    DispatchQueue.main.async {
      if self.view.subviews.contains(showLoadingMainView) {
        return
      }
      //self.navigationController?.navigationBar.isUserInteractionEnabled = false
      //self.tabBarController?.tabBar.isUserInteractionEnabled = false
      //self.view.isUserInteractionEnabled = false
      showLoadingMainView = UIView(frame: CGRect(x: self.view.frame.width / 2 + 25, y: self.view.frame.height / 2 + 25, width: 50, height: 50))
      showLoadingMainView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
      self.view.addSubview(showLoadingMainView)
      showLoadingMainView.addSubview(animationView)
      showLoadingMainView.translatesAutoresizingMaskIntoConstraints = false
      showLoadingMainView.heightAnchor.constraint(equalToConstant: self.view.frame.height).isActive = true
      showLoadingMainView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
      showLoadingMainView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
      showLoadingMainView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
      animationView.translatesAutoresizingMaskIntoConstraints = false
      animationView.heightAnchor.constraint(equalToConstant: self.view.frame.height/2).isActive = true
      animationView.widthAnchor.constraint(equalToConstant: self.view.frame.width/2).isActive = true
      animationView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
      animationView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
      animationView.animation = animation
      // Setup our animaiton view
      animationView.contentMode = .scaleAspectFit
      // Lets turn looping on, since we want it to repeat while the image is ‘Downloading’
      animationView.loopMode = .autoReverse
      // Now play from 0 to 0.5 progress and loop indefinitely.
      animationView.play(fromProgress: 0, toProgress: 0.065, loopMode: .autoReverse, completion: nil)
    }
  }
  func stopLoading() {
    
    indicator.stopAnimating()
    refreshControl.endRefreshing()
    self.view.isUserInteractionEnabled = true
//    DispatchQueue.main.async {
//      //self.navigationController?.navigationBar.isUserInteractionEnabled = true
//      //self.tabBarController?.tabBar.isUserInteractionEnabled = true
//      //self.view.isUserInteractionEnabled = true
//      showLoadingMainView.removeFromSuperview()
//    }
  }
}
