//
//  ViewController.swift
//  LabelScrollViewTest
//
//  Created by Benjamin Hendricks on 9/7/16.
//  Copyright © 2016 coolbnjmn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var theLabel: UILabel!
    @IBOutlet weak var scrollViewTrailing: NSLayoutConstraint!
    
    @IBOutlet weak var scrollViewLeading: NSLayoutConstraint!
    
    @IBOutlet weak var scrollViewBottom: NSLayoutConstraint!
    @IBOutlet weak var scrollViewTop: NSLayoutConstraint!
    
    var isExpanded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollViewTop.constant = 10
        scrollViewLeading.constant = 10
        scrollViewTrailing.constant = 10
        scrollViewBottom.constant = 300
        
        view.setNeedsUpdateConstraints()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapScrollView(_:)))
        scrollView.addGestureRecognizer(tapGestureRecognizer)
        
        scrollView.backgroundColor = UIColor.greenColor()
        theLabel.backgroundColor = UIColor.redColor()
        theLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin velit lectus, luctus et pretium at, fermentum quis felis. Donec sapien diam, hendrerit sed ipsum et, suscipit tincidunt lacus. Maecenas fermentum iaculis dui, euismod bibendum tortor mollis et. Pellentesque viverra libero sed efficitur malesuada. Donec egestas odio lorem, ac porttitor augue ultrices nec. Donec vestibulum est imperdiet purus finibus faucibus. Suspendisse scelerisque diam ac accumsan tempor. In hac habitasse platea dictumst. Nulla quis nisi id magna volutpat molestie. Vivamus maximus, leo id varius luctus, turpis nunc vehicula lacus, non consequat magna metus nec ante. Pellentesque consectetur nunc sed magna eleifend, ac facilisis felis sodales. Pellentesque ut accumsan dolor. Integer turpis tellus, tempus quis mollis non, euismod vel justo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Morbi vestibulum lorem nec varius luctus. Ut porta semper nibh quis pretium. Pellentesque vestibulum tincidunt dolor et tincidunt. Aliquam hendrerit eros quis lacus suscipit, ac laoreet nunc finibus. Cras auctor, mi sit amet rutrum consequat, felis lorem placerat velit, sed vestibulum lacus ex in erat. Nam feugiat eget sapien id commodo. Duis porttitor mollis risus, eget dapibus ipsum pulvinar non. Nunc eget posuere orci, facilisis commodo libero. Integer lacinia fringilla nisi, ac hendrerit velit tincidunt ac. Curabitur rutrum, purus ut tincidunt accumsan, mi ligula laoreet nisi, id posuere tortor sapien ac dolor. Donec at magna diam. Proin placerat malesuada rhoncus. Aliquam ornare placerat volutpat. Pellentesque quis metus a purus porta porttitor. Morbi consectetur risus at leo venenatis, placerat porta nisl hendrerit. Sed dapibus ex a semper ullamcorper. Aenean vehicula tellus hendrerit, sagittis mi vitae, faucibus turpis. Proin nec maximus diam, in blandit mauris. Nulla facilisi. Phasellus laoreet dolor nec enim tempus ultricies ut vitae nibh. In auctor dictum libero. Nulla gravida elit ac commodo eleifend. Cras bibendum erat nunc, vel auctor mi fermentum vitae."
    }

    func tapScrollView(sender: AnyObject) {
        if isExpanded {
            // shrink
            isExpanded = false
            scrollViewTop.constant = 10
            scrollViewLeading.constant = 10
            scrollViewTrailing.constant = 10
            scrollViewBottom.constant = 300
            
            theLabel.setContentCompressionResistancePriority(UILayoutPriorityDefaultLow, forAxis: .Vertical)
        } else {
            // expand
            isExpanded = true
            scrollViewTop.constant = 0
            scrollViewLeading.constant = 0
            scrollViewTrailing.constant = 0
            scrollViewBottom.constant = 0
            theLabel.setContentCompressionResistancePriority(UILayoutPriorityRequired, forAxis: .Vertical)
        }
        view.setNeedsUpdateConstraints()
        scrollView.invalidateIntrinsicContentSize()
    }
}

