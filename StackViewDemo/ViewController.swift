//
//  ViewController.swift
//  StackViewDemo
//
//  Created by Alexander Kostiev on 10/20/17.
//  Copyright © 2017 Alexander Kostiev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var viewState: ViewState = ViewState() {
        didSet {
            let animationDuration = TimeInterval(viewState.animated ? 0.3 : 1)
            
            UIView.animate(withDuration: animationDuration) {
                self.stackViewUnderTest.axis = self.viewState.axis
                self.stackViewUnderTest.alignment = self.viewState.alignment
                self.stackViewUnderTest.distribution = self.viewState.distribution
                self.stackViewUnderTest.spacing = self.viewState.spacing
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var segmentedControlAxis: UISegmentedControl!
    @IBOutlet weak var segmentedControlDistribution: UISegmentedControl!
    @IBOutlet weak var segmentedControlAlignment: UISegmentedControl!
    @IBOutlet weak var textFieldSpacing: UITextField!
    @IBOutlet weak var switchAnimated: UISwitch!

    @IBOutlet weak var stackViewUnderTest: UIStackView!
    
    @IBAction func onApply(_ sender: Any) {
        let newViewState = buildViewState()
        if viewState != newViewState {
            viewState = newViewState
        }
    }
    
    // MARK: - Private methods -
    
    private func buildViewState() -> ViewState {
        var newViewState = viewState
        
        newViewState.axis = currentlySelectedAxis()
        newViewState.alignment = currentlySelectedAlignment()
        newViewState.distribution = currentlySelectedDistribution()
        newViewState.spacing = currentlySelectedSpacing()
        newViewState.animated = currentlySelectedAnimated()
        
        return newViewState
    }

    private func currentlySelectedAxis() -> UILayoutConstraintAxis {
        let index = segmentedControlAxis.selectedSegmentIndex
        if segmentedControlAxis.titleForSegment(at: index) == "Horizontal" {
            return .horizontal
        }
        
        return .vertical
    }
    
    private func currentlySelectedDistribution() -> UIStackViewDistribution {
        let index = segmentedControlDistribution.selectedSegmentIndex
        if segmentedControlDistribution.titleForSegment(at: index) == "Fill" {
            return .fill
        }
        else if segmentedControlDistribution.titleForSegment(at: index) == "Fill =" {
            return .fillEqually
        }
        else if segmentedControlDistribution.titleForSegment(at: index) == "Fill ||" {
            return .fillProportionally
        }
        else if segmentedControlDistribution.titleForSegment(at: index) == "= |_|" {
            return .equalSpacing
        }
        else if segmentedControlDistribution.titleForSegment(at: index) == "= -|-" {
            return .equalCentering
        }
        
        return .fill
    }
    
    private func currentlySelectedAlignment() -> UIStackViewAlignment {
        let index = segmentedControlAlignment.selectedSegmentIndex
        if segmentedControlAlignment.titleForSegment(at: index) == "Fill" {
            return .fill
        }
        else if segmentedControlAlignment.titleForSegment(at: index) == "Leading" {
            return .leading
        }
        else if segmentedControlAlignment.titleForSegment(at: index) == "Center" {
            return .center
        }
        else if segmentedControlAlignment.titleForSegment(at: index) == "Trailing" {
            return .trailing
        }
        
        return .fill
    }
    
    private func currentlySelectedSpacing() -> CGFloat {
        return CGFloat(Float(textFieldSpacing.text ?? "0") ?? 0)
    }
    
    private func currentlySelectedAnimated() -> Bool {
        return switchAnimated.isOn
    }
}

