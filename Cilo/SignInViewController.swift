//
//  SignInViewController.swift
//  Mega
//
//  Created by Tope Abayomi on 10/12/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation

class SignInViewController : PFLogInViewController, UITextFieldDelegate {
    
    @IBOutlet var titleLabel : UILabel!
    
    @IBOutlet var facebookButton : UIButton!
    @IBOutlet var twitterButton : UIButton!

    @IBOutlet var bgImageView : UIImageView!
    
    @IBOutlet var noAccountButton : UIButton!
    @IBOutlet var signInButton : UIButton!
    
    @IBOutlet var forgotPassword : UIButton!
    
    @IBOutlet var passwordContainer : UIView!
    @IBOutlet var passwordLabel : UILabel!
    @IBOutlet var passwordTextField : UITextField!
    @IBOutlet var passwordUnderline : UIView!

    @IBOutlet var userContainer : UIView!
    @IBOutlet var userLabel : UILabel!
    @IBOutlet var userTextField : UITextField!
    @IBOutlet var userUnderline : UIView!
    @IBOutlet var dissmissButton: UIButton!

    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        self.logInView?.addSubview(facebookButton)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //直接改PFLoginViewController
        self.logInView?.passwordForgottenButton?.setTitle("忘記密碼？", forState: .Normal)
        self.logInView?.passwordForgottenButton?.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.logInView?.logInButton?.setTitle("登錄", forState: .Normal)
        self.logInView?.signUpButton?.setTitle("註冊", forState: .Normal)
        self.logInView?.usernameField?.placeholder = "行動電話"
        self.logInView?.usernameField?.keyboardType = UIKeyboardType.PhonePad
        self.logInView?.usernameField?.font = UIFont(name: MegaTheme.fontName(), size: 20)
        self.logInView?.usernameField?.textColor = UIColor.blackColor()
        self.logInView?.passwordField?.placeholder = "登錄密碼"
        self.logInView?.passwordField?.font = UIFont(name: MegaTheme.fontName(), size: 20)
        self.logInView?.passwordField?.textColor = UIColor.blackColor()
        self.logInView?.facebookButton?.setTitle("使用Facebook登錄", forState: .Normal)
        
        
        //如果要呼叫自己設計的忘記密碼頁面。
//        self.logInView?.passwordForgottenButton?.addTarget(self, action: "forgotPasswordButtonPressed:", forControlEvents: .TouchUpInside)
        
        
//        if let optionalImage:UIImage? = UIImage(named: "nav-gb-2"), image = optionalImage {
//            self.logInView?.backgroundColor = UIColor(patternImage: image)
//        }
        
        if let image = UIImage(named: "nav-gb-2") {
            self.logInView?.backgroundColor = UIColor(patternImage: image)
        }
        
        
//        bgImageView.image = UIImage(named: "nav-bg-2")
//        bgImageView.contentMode = .ScaleAspectFill
//        
//        titleLabel.text = "Cilo"
//        titleLabel.font = UIFont(name: MegaTheme.semiBoldFontName(), size: 45)
//        titleLabel.textColor = UIColor.whiteColor()
//        
//        dissmissButton.addTarget(self, action: "dismiss", forControlEvents: .TouchUpInside)
        
//        twitterButton.setTitle("Sign in with Twitter", forState: .Normal)
//        twitterButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
//        twitterButton.titleLabel?.font = UIFont(name: MegaTheme.semiBoldFontName, size: 15)
//        twitterButton.backgroundColor = UIColor(red: 0.23, green: 0.43, blue: 0.88, alpha: 1.0)
//        twitterButton.addTarget(self, action: "dismiss", forControlEvents: .TouchUpInside)
        
        

//        let attributedText = NSMutableAttributedString(string: "Don't have an account? Sign up")
//        attributedText.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.StyleSingle.rawValue, range: NSMakeRange(10, 7))
//        attributedText.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor(), range: NSMakeRange(0, attributedText.length))
//        
////        noAccountButton.setAttributedTitle(attributedText, forState: .Normal)
//        noAccountButton.setTitle("還不是會員嗎？立馬註冊一個新的", forState: .Normal)
//        noAccountButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
//        noAccountButton.titleLabel?.font = UIFont(name: MegaTheme.semiBoldFontName(), size:14)
//        noAccountButton.addTarget(self, action: "signupButtonPressed:", forControlEvents: .TouchUpInside)
//        
//        signInButton.setTitle("登錄", forState: .Normal)
//        signInButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
//        signInButton.titleLabel?.font = UIFont(name: MegaTheme.semiBoldFontName(), size: 22)
//        signInButton.layer.borderWidth = 3
//        signInButton.layer.borderColor = UIColor.whiteColor().CGColor
//        signInButton.layer.cornerRadius = 5
////        signInButton.addTarget(self, action: "dismiss", forControlEvents: .TouchUpInside)
//        
//        forgotPassword.setTitle("忘記密碼?", forState: .Normal)
//        forgotPassword.setTitleColor(UIColor.whiteColor(), forState: .Normal)
//        forgotPassword.titleLabel?.font = UIFont(name: MegaTheme.semiBoldFontName(), size: 15)
////        forgotPassword.addTarget(self, action: "dismiss", forControlEvents: .TouchUpInside)
//        
//        passwordContainer.backgroundColor = UIColor.clearColor()
//        
//        passwordLabel.text = "密碼"
//        passwordLabel.font = UIFont(name: MegaTheme.fontName(), size: 20)
//        passwordLabel.textColor = UIColor.whiteColor()
//
//        passwordTextField.text = ""
//        passwordTextField.font = UIFont(name: MegaTheme.fontName(), size: 20)
//        passwordTextField.textColor = UIColor.whiteColor()
//        passwordTextField.secureTextEntry = true
//        passwordTextField.delegate = self
//        
//        userContainer.backgroundColor = UIColor.clearColor()
//        
//        userLabel.text = "電話"
//        userLabel.font = UIFont(name: MegaTheme.fontName(), size: 20)
//        userLabel.textColor = UIColor.whiteColor()
//        
//        userTextField.text = ""
//        userTextField.font = UIFont(name: MegaTheme.fontName(), size: 20)
//        userTextField.textColor = UIColor.whiteColor()
//        
//        self.activityIndicator.hidden = true
        
        //Looks for single or multiple taps.
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        
    }
    
    override func viewDidLayoutSubviews() {
        
//        let facebookBtnBounds = signInButton?.bounds
//        self.logInView?.logInButton?.frame = CGRectMake(facebookBtnBounds!.maxX, facebookBtnBounds!.maxY, facebookBtnBounds!.width, facebookBtnBounds!.height)
        
        var ButtonWidth = (self.view.frame.size.width - 32)
        var X_Co = (self.view.frame.size.width - ButtonWidth)/2
        var Y_Co = (self.view.frame.size.height - 50 - 10)//距離底部高10px
        
        self.logInView?.facebookButton?.frame = CGRectMake(X_Co, Y_Co - 60, ButtonWidth, 50.0)
//        self.logInView?.signUpButton?.frame = CGRectMake(X_Co, Y_Co, ButtonWidth, 50.0)
        
        self.logInView?.signUpButton?.setTitle("註冊", forState: .Normal)
        self.logInView?.facebookButton?.setTitle("使用Facebook登錄", forState: .Normal)
        self.logInView?.facebookButton?.titleLabel?.font = UIFont(name: MegaTheme.semiBoldFontName(), size: 22)
        
        let image = UIImage(named: "nav-bg-2")
        var bgView = UIImageView(image: image)
        self.logInView?.addSubview(bgView)
        self.logInView?.sendSubviewToBack(bgView)
        
        let facebookButton = UIButton()
        
        facebookButton.setTitle("使用Facebook登錄", forState: .Normal)
        facebookButton.frame = CGRectMake(X_Co, Y_Co - 60, ButtonWidth, 50.0)
        facebookButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        facebookButton.titleLabel?.font = UIFont(name: MegaTheme.semiBoldFontName(), size: 16)
        facebookButton.backgroundColor = UIColor(red: 0.21, green: 0.30, blue: 0.55, alpha: 1.0)
        facebookButton.addTarget(self, action: "facebookLoginButtonPressed:", forControlEvents: .TouchUpInside)
        facebookButton.layer.cornerRadius = 5
        
        self.logInView?.addSubview(facebookButton)
        
        //新增一個註冊的按鈕。
//        let SignInButton = UIButton()
//        SignInButton.frame = CGRectMake(X_Co, Y_Co, ButtonWidth, 50.0)
//        SignInButton.setTitle("使用Facebook登錄", forState: .Normal)
//        SignInButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
//        SignInButton.titleLabel?.font = UIFont(name: MegaTheme.semiBoldFontName(), size: 22)
//        SignInButton.layer.borderWidth = 3
//        SignInButton.layer.borderColor = UIColor.whiteColor().CGColor
//        SignInButton.layer.cornerRadius = 5
//        SignInButton.addTarget(self, action: "signupButtonPressed:", forControlEvents: .TouchUpInside)
//        
//        self.logInView?.addSubview(SignInButton)
        
//        let dismissBtn = UIButton()
//        dismissBtn.frame = CGRectMake(12.0, 45.0, 30.0, 30.0)
//        dismissBtn.setTitle("✕", forState: .Normal)
//        dismissBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
//        dismissBtn.titleLabel?.font = UIFont(name: MegaTheme.lighterFontName(), size: 24)
//        dismissBtn.layer.borderWidth = 0.5
//        dismissBtn.layer.borderColor = UIColor.whiteColor().CGColor
//        dismissBtn.layer.cornerRadius = 15.0
//        dismissBtn.addTarget(self, action: "dismiss", forControlEvents: .TouchUpInside)
//        
//        self.logInView?.addSubview(dismissBtn)
        
        //如果要安插新的Logo，就要指定相對應的位置及高度
        let logoimage = UIImage(named: "logo")
        var LogoView = UIImageView(image: logoimage)
        LogoView.frame = CGRectMake(70, 130, 187, 59)
        self.logInView?.logo = LogoView

    }
    
    override func willTransitionToTraitCollection(newCollection: UITraitCollection, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
         titleLabel.hidden = newCollection.verticalSizeClass == UIUserInterfaceSizeClass.Compact    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    func dismiss(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //Calls this function when the tap is recognized.
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    //密碼鍵盤按下Go == 按下登錄按鈕
    override func textFieldShouldReturn(textField: UITextField) -> Bool {
        //使用ParseUI 不需要指定動作
//        self.loginButtonPressed(self)
        return true
    }
    
    @IBAction func signupButtonPressed(sender: AnyObject) {
        self.performSegueWithIdentifier("signup", sender: self)
    }
    
    @IBAction func forgotPasswordButtonPressed(sender: AnyObject) {
        self.performSegueWithIdentifier("password", sender: self)
    }
    
    @IBAction func loginButtonPressed(sender: AnyObject) {
        var userName = userTextField.text
        var userPassword = passwordTextField.text
        
        PFUser.logInWithUsernameInBackground(userName, password: userPassword) { (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                self.activityIndicator.stopAnimating()
                //通常取消登錄流程即可
                dispatch_async(dispatch_get_main_queue()) {
                    self.dismissViewControllerAnimated(true, completion: { () -> Void in
                        
                    })
                }
            } else {
                self.activityIndicator.stopAnimating()
                
                if let message: AnyObject = error!.userInfo!["error"] {
                    if let message: AnyObject = error!.userInfo!["error"] {
                        let alertController = UIAlertController(title: "登錄時發生錯誤",
                            message: message as? String,
                            preferredStyle: UIAlertControllerStyle.Alert
                        )
                        alertController.addAction(UIAlertAction(title: "確定",
                            style: UIAlertActionStyle.Default,
                            handler: nil)
                        )
                        // Display alert
                        self.presentViewController(alertController, animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    @IBAction func facebookLoginButtonPressed(sender: AnyObject) {
        // These are the permissions we need:
        var permissionsNeeded = ["public_profile", "email", "user_friends"]
        
        PFFacebookUtils.logInInBackgroundWithReadPermissions(permissionsNeeded) {
            (user: PFUser?, error: NSError?) -> Void in
            if let user = user {
                if user.isNew {
                    println("User signed up and logged in through Facebook!")
//                    self.activityIndicator.stopAnimating()
                    //通常取消登錄流程即可
                    dispatch_async(dispatch_get_main_queue()) {
                        self.dismissViewControllerAnimated(true, completion: { () -> Void in
                            
                        })
                    }
                } else {
                    println("User logged in through Facebook!")
//                    self.activityIndicator.stopAnimating()
                    //通常取消登錄流程即可
                    self.dismissViewControllerAnimated(true, completion: { () -> Void in
                        
                    })
                }
            } else {
                println("Uh oh. The user cancelled the Facebook login.")
                //發生了一些錯誤，造成無法登錄
                if let message: AnyObject = error!.userInfo!["error"] {
                    if let message: AnyObject = error!.userInfo!["error"] {
                        let alertController = UIAlertController(title: "登錄時發生錯誤",
                            message: message as? String,
                            preferredStyle: UIAlertControllerStyle.Alert
                        )
                        alertController.addAction(UIAlertAction(title: "確定",
                            style: UIAlertActionStyle.Default,
                            handler: nil)
                        )
                        // Display alert
                        self.presentViewController(alertController, animated: true, completion: nil)
                    }
                }
            }
        }
        
//        PFFacebookUtils.logInInBackgroundWithPublishPermissions(permissionsNeeded, block: { (user: PFUser?, error: NSError?) -> Void in
//            println("註冊按鈕")
//            
//            if let user = user {
//                if user.isNew {
//                    println("User signed up and logged in through Facebook!")
//                    self.activityIndicator.stopAnimating()
//                    //新的註冊用戶，要導航倒手機驗證畫面等
//                } else {
//                    println("User logged in through Facebook!")
//                    self.activityIndicator.stopAnimating()
//                    //通常取消登錄流程即可
//                    dispatch_async(dispatch_get_main_queue()) {
//                        self.dismissViewControllerAnimated(true, completion: { () -> Void in
//                            
//                        })
//                    }
//                }
//            } else {
//                println("Uh oh. The user cancelled the Facebook login.")
//                
//                self.activityIndicator.stopAnimating()
//                //發生了一些錯誤，造成無法登錄
//                if let message: AnyObject = error!.userInfo!["error"] {
//                    if let message: AnyObject = error!.userInfo!["error"] {
//                        let alertController = UIAlertController(title: "登錄時發生錯誤",
//                            message: message as? String,
//                            preferredStyle: UIAlertControllerStyle.Alert
//                        )
//                        alertController.addAction(UIAlertAction(title: "確定",
//                            style: UIAlertActionStyle.Default,
//                            handler: nil)
//                        )
//                        // Display alert
//                        self.presentViewController(alertController, animated: true, completion: nil)
//                    }
//                }
//            }
//        })
    }
}


