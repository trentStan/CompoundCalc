//
//  tabBar.swift
//  CompoundCalc
//
//  Created by IACD-022 on 2022/04/15.
//

import Foundation
import UIKit

class TabViewController: UITabBarController{
    
    var userDirection: UISwipeGestureRecognizer.Direction = []
    var previousIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
          var swipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture))
        swipe.numberOfTouchesRequired = 1
        swipe.direction = .left
        self.view.addGestureRecognizer(swipe)
        
        swipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture))
        swipe.numberOfTouchesRequired = 1
        swipe.direction = .right
        self.view.addGestureRecognizer(swipe)
    }
    
    
    
    @IBAction func swipeGesture (swipe: UISwipeGestureRecognizer){
        switch swipe.direction{
        case .left:
            if selectedIndex > 0 {
                self.previousIndex = selectedIndex
                self.selectedIndex = self.selectedIndex - 1
            }
            userDirection = .left
            break
        case .right:
            if selectedIndex < 2{
                self.previousIndex = selectedIndex
                self.selectedIndex = self.selectedIndex + 1
            }
            userDirection = .right
            break
        default:
            print("do nothing")
            
        }
        
        
    }
}
extension TabViewController: UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return TabViewAnimation(direction: userDirection)
    }
    
    
}

class TabViewAnimation : NSObject , UIViewControllerAnimatedTransitioning  {
   var direction: UISwipeGestureRecognizer.Direction = []
    
    init(direction: UISwipeGestureRecognizer.Direction){
        super.init()
        self.direction = direction
    }
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval{
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning){
        guard let destination =  transitionContext.view(forKey: .to) else {return}
        var direct: CGFloat = 0
        if direction == .right{
            direct = -destination.frame.width
            
        } else if direction == .left{
            direct = destination.frame.width
        }
        
        destination.transform = CGAffineTransform(translationX:
        direct, y: 0)
        transitionContext.containerView.addSubview(destination)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {destination.transform = .identity}, completion: {transitionContext.completeTransition($0)})
    }
}
