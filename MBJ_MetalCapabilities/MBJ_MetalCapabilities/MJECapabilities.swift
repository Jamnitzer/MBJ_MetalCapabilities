//
//  MBECapabilities.m
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
//------------------------------------------------------------------------------
class MJECapabilities
{
    var device:MTLDevice! = nil
    //------------------------------------------------------------------------------
    class func capabilitiesWithDevice(device:MTLDevice) -> MJECapabilities
    {
        return MJECapabilities(device:device)
    }
    //------------------------------------------------------------------------------
    init(device:MTLDevice)
    {
        self.device = device
    }
    //------------------------------------------------------------------------------
    var highestSupportedFeatureSet:MTLFeatureSet
        {
        get {
           // let maxKnownFeatureSet:MTLFeatureSet = .iOS_GPUFamily3_v1
            let maxKnownFeatureSet:MTLFeatureSet = .iOS_GPUFamily2_v1
            let maxFeatureUInt:UInt = UInt(maxKnownFeatureSet.rawValue)
            
            for (var featureSet:UInt = maxFeatureUInt; featureSet >= 0; --featureSet)
            {
                if (self.device.supportsFeatureSet(MTLFeatureSet(rawValue: featureSet)!))
                {
                    return MTLFeatureSet(rawValue: featureSet)!
                }
            }
            return MTLFeatureSet.iOS_GPUFamily1_v1
        }
    }
    //------------------------------------------------------------------------------
    var featureSetGPUFamily:UInt
        {
        get {
            switch (self.highestSupportedFeatureSet)
            {
            case MTLFeatureSet.iOS_GPUFamily3_v1: return 3
            case MTLFeatureSet.iOS_GPUFamily2_v1: return 2
            case MTLFeatureSet.iOS_GPUFamily1_v1: return 1
            default:  return 1
            }
        }
    }
    //------------------------------------------------------------------------------
    var featureSetVersion:UInt
        {
        get {
            return 1
        }
    }
    //------------------------------------------------------------------------------
    var maximumRenderPassColorAttachments:UInt
        {
        get {
            switch (self.highestSupportedFeatureSet)
            {
            case MTLFeatureSet.iOS_GPUFamily2_v1: return 8
            case MTLFeatureSet.iOS_GPUFamily1_v1: return 4
            default: return 4
            }
        }
    }
    //------------------------------------------------------------------------------
    var supportsASTCPixelFormats:Bool
        {
        get {
            return self.featureSetGPUFamily > 1
        }
    }
    //------------------------------------------------------------------------------
}
//------------------------------------------------------------------------------
