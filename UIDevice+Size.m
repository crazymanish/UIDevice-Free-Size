//
//  UIDevice+Size.m
//  
//
//  Created by Manish Rathi on 10/12/13.
//  Copyright (c) 2013 Manish Rathi. All rights reserved.
//

#import "UIDevice+Size.h"

@implementation UIDevice (Size)

/*
 #include <sys/param.h>
 #include <sys/mount.h>
 
-(void)diskSpace {
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    struct statfs tStats;
    statfs([[paths lastObject] cString], &tStats);
    float total_space = (tStats.f_blocks * tStats.f_bsize);
    float free_space = (float)(tStats.f_bavail * tStats.f_bsize);
    NSLog(@"Memory Capacity of %f MiB with %f MiB Free memory available.", ((total_space/1024)/1024), ((free_space/1024)/1024));
}
 */

+(float)freeDiskSpaceInMB{
    __autoreleasing NSError *error = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[paths lastObject] error: &error];
    
    if (dictionary) {
        return ([[dictionary objectForKey:NSFileSystemFreeSize] floatValue]/(1024*1024));
    }else{
        NSLog(@"Error Obtaining System Memory Info: Domain = %@, Code = %d", [error domain], [error code]);
    }
    
    return 0.0f;
}

+(float)totalDiskSpaceInMB{
    __autoreleasing NSError *error = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[paths lastObject] error: &error];
    
    if (dictionary){
        return ([[dictionary objectForKey:NSFileSystemSize] floatValue]/(1024*1024));
    }else{
        NSLog(@"Error Obtaining System Memory Info: Domain = %@, Code = %d", [error domain], [error code]);
    }
    
    return 0.0f;
}
@end