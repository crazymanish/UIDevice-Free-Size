//
//  UIDevice+Size.h
//
//
//  Created by Manish Rathi on 10/12/13.
//  Copyright (c) 2013 Manish Rathi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Size)

+(float)freeDiskSpaceInMB;
+(float)totalDiskSpaceInMB;
@end