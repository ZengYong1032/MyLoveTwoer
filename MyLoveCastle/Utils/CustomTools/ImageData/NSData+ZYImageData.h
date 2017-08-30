//
//  NSData+ZYImageData.h
//  AddressBookApplication
//
//  Created by ZyZl on 2017/6/19.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (ZYImageData)

/**
 Compreess Image Data

 @param source_image    Image what should be compressed
 @param maxSize    Max size (KB)
 @return    ImageData
 */
+ (NSData *)resetSizeWithImage:(UIImage *)source_image maxSize:(NSInteger)maxSize;

@end
