//
//  ViewController.swift
//  AnalyticsApp
//
//  Created by hussien alrubaye on 1/26/17.
//  Copyright © 2017 hussien alrubaye. All rights reserved.
//

import UIKit
import GoogleMobileAds;

class ViewController: UIViewController {
    var interstitial: GADInterstitial!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createAndLoadInterstitial()

    }

   
    
    fileprivate func createAndLoadInterstitial() {
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-5199146765622636/6939376909")
        let request = GADRequest()
        // Request test ads on devices you specify. Your test device ID is printed to the console when
        // an ad request is made.
        request.testDevices = [ kGADSimulatorID, "2077ef9a63d2b398840261c8221a0c9b" ]
        interstitial.load(request)
    }


    @IBAction func BuDisplayAds(_ sender: Any) {
        
        UIAlertView(title: "Game Over",
                    message: "Your time ran out!",
                    delegate: self,
                    cancelButtonTitle: "Ok").show()
    }
    
    
    
    func alertView(_ alertView: UIAlertView, willDismissWithButtonIndex buttonIndex: Int) {
        if interstitial.isReady {
            interstitial.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready")
        }
        // Give user the option to start the next game.
    }


}

