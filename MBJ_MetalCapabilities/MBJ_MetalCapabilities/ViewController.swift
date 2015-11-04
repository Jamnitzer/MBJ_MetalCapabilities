//
//  ViewController.m
//  MetalCapabilities
//
//  Created by Warren Moore on 9/23/14.
//  Copyright (c) 2014 Metal By Example. All rights reserved.
//------------------------------------------------------------------------
//  converted to Swift by Jamnitzer (Jim Wrenholt)
//------------------------------------------------------------------------
import UIKit
import Metal

//------------------------------------------------------------------------------
func getName(classType:AnyClass) -> String {
    
    let classString = NSStringFromClass(classType.self)
    let range = classString.rangeOfString(".",
        options: NSStringCompareOptions.CaseInsensitiveSearch,
        range: Range<String.Index>(start:classString.startIndex,
            end: classString.endIndex),
        locale: nil)
    
    return classString.substringFromIndex(range!.endIndex)
}
//------------------------------------------------------------------------------
class ViewController: UIViewController
{
    @IBOutlet weak var gpuFamilyLabel: UILabel!
    @IBOutlet weak var featureSetLabel: UILabel!
    @IBOutlet weak var colorAttachmentLabel: UILabel!
    @IBOutlet weak var atscSupportLabel: UILabel!
    @IBOutlet weak var deviceTypeLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let device = MTLCreateSystemDefaultDevice()
        if (device == nil)
        {
            print("Could not create a Metal device!")
        }
        else
        {
            //let deviceClassNameC = getName(MTLDevice.self); print("deviceClassNameC = \(deviceClassNameC)")
            //let deviceClassNameF = getName(MTLDevice); print("deviceClassNameF = \(deviceClassNameF)")
            //let deviceClassNameJ = NSStringFromClass(MTLDevice.self); print("deviceClassNameJ = \(deviceClassNameJ)")
            //let deviceClassNameM = NSStringFromClass(MTLDevice); print("deviceClassNameM = \(deviceClassNameM)")

            let deviceClassName = "MTLDebugDevice" // ?
            let d1:String = String("The concrete class of the device is \(deviceClassName)")
            self.deviceTypeLabel.text = d1
            
            let caps = MJECapabilities.capabilitiesWithDevice(device!)
            let gpuFamily = caps.featureSetGPUFamily
            var gpuName:String
            if (gpuFamily == 1)
            {
                gpuName = "A7"
            }
            else
            {
                gpuName = "A8"
            }
            self.gpuFamilyLabel.text = String("GPU Family: \(gpuFamily) \(gpuName)")
            self.featureSetLabel.text = String("Feature Set Version: \(caps.featureSetVersion)")
            self.colorAttachmentLabel.text = String("Maximum Color Attachments: \( caps.maximumRenderPassColorAttachments)")
            
            let supportsATSC:Bool = caps.supportsASTCPixelFormats
            var atscLabelColor:UIColor
            if (supportsATSC)
            {
                atscLabelColor = UIColor(red:0.0, green:0.5, blue:0.0, alpha:1.0)
            }
            else
            {
                atscLabelColor = UIColor(red:0.7, green:0.0, blue:0.0, alpha:1.0)
            }
            
            var atsc_support:String
            if (supportsATSC)
            {
                atsc_support = "Supports ATSC Pixel Format"
            }
            else
            {
                atsc_support = "Does Not Support ATSC Pixel Format"
            }
            self.atscSupportLabel.text = atsc_support
            self.atscSupportLabel.textColor = atscLabelColor
       }
   }
    //------------------------------------------------------------------------------
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //------------------------------------------------------------------------------
}
//------------------------------------------------------------------------------

