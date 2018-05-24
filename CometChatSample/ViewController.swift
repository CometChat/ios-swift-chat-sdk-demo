//
//  ViewController.swift
//  CometChatSample
//
//  Created by aditya gokula on 21/05/18.
//  Copyright © 2018 Inscripts (I) Private Limited. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnInitializeChat: UIButton!
    @IBOutlet weak var btnLoginSuperHero1: UIButton!
    @IBOutlet weak var btnLoginSuperHero2: UIButton!
    @IBOutlet weak var btnLaunchChat: UIButton!
    @IBOutlet weak var pbLoading: UIView!
    var licenseKey : String = "COMETCHAT-XXXX-XXXX-XXXX-XXXX"  // Replace this value with your CometChat License Key
    var apiKey : String = "xxxxxxxxxxxxxxxxxxxxxx" // Replace the value with your CometChat Api Key;
    var UID1 : String = "SUPERHERO1"
    var UID2 : String = "SUPERHERO2"
    var isCometOnDemand: Bool = true; // For CometChat Cloud Users, Please set this to true
    
    var cometChat: CometChat = CometChat();
    var readyUI: readyUIFIle = readyUIFIle();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    @IBAction func initializeChat() -> Void {
        self.showLoading(show:true);
        cometChat.initializeCometChat("", licenseKey:licenseKey, apikey:apiKey, isCometOnDemand:isCometOnDemand, success: {(response) in
            print(" successfully initailized")
            self.btnLoginSuperHero1.isEnabled = true;
            self.btnLoginSuperHero2.isEnabled = true;
            self.showLoading(show:false);
        },failure:{(error) in
            print(" Failed to initialized ")
            self.showLoading(show:false);
        });
    }
    
    
    @IBAction func loginWithSuperHero1() -> Void {
        self.showLoading(show:true);
        cometChat.login(withUID:UID1,success:{(response) in
            print(" Successful login ")
            self.btnLaunchChat.isEnabled = true;
            self.showLoading(show:false);
        },failure:{(error) in
            print(" Failed login ")
            self.showLoading(show:false);
        });
    }
    
    @IBAction func loginWithSuperHero2() -> Void {
        self.showLoading(show:true);
        cometChat.login(withUID:UID2,success:{(response) in
            print(" Successful login ")
             self.btnLaunchChat.isEnabled = true;
            self.showLoading(show:false);
        },failure:{(error) in
            print(" Failed login ")
            self.showLoading(show:false);
        });
    }
    
    @IBAction func launchChat() -> Void {
        let isFullScreen : Bool = true;
        self.showLoading(show:true);
        readyUI.launchCometChat(isFullScreen, observer: self, userInfo: { (response) in
            print("Launch ReadyUI Successfull  ")
            self.showLoading(show:false);
        }, groupInfo: { (response) in
            
        }, onMessageReceive: { (response) in
            
        }, success: { (response) in
            
        }, failure: { (error) in
            print(" Failed ReadyUI lauch ")
            self.showLoading(show:false);
        }, onLogout: { (response) in
            print(" Logout ")
        })
        
    }
    
    func showLoading(show:Bool) -> Void {
        if(show){
            pbLoading.isHidden = false;
        }else{
            pbLoading.isHidden = true;
        }
    }

}

