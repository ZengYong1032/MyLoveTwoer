//
//  NSData+ZYImageData.m
//  AddressBookApplication
//
//  Created by ZyZl on 2017/6/19.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "NSData+ZYImageData.h"

@implementation NSData (ZYImageData)

+(NSData *)resetSizeWithImage:(UIImage *)source_image maxSize:(NSInteger)maxSize
{
    
    /**
     Trim image R.P.
     */
    
    CGSize imageSize = CGSizeMake(source_image.size.width, source_image.size.height);
    
    CGFloat tempHeight = imageSize.width / 1024 ;
    CGFloat tempWidth = imageSize.height / 1024 ;
    
    if (tempWidth > 1.0 && tempWidth > tempHeight)
    {
        imageSize = CGSizeMake(source_image.size.width / tempWidth, source_image.size.height / tempWidth);
    }
    else if(tempHeight > 1.0 && tempHeight > tempWidth)
    {
        imageSize = CGSizeMake(source_image.size.width / tempHeight, source_image.size.height / tempHeight);
    }
    
    UIGraphicsBeginImageContext(imageSize);
    [source_image drawInRect:CGRectMake(0, 0, imageSize.width, imageSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    /**
     Trim Image Size Of Space (KB)
     */
    
    NSData *imageData = UIImageJPEGRepresentation(newImage, 1.0);
    NSUInteger sizeOrigin = [imageData length];
    NSUInteger sizeOriginKB = sizeOrigin / 1024 ;
    
    if (sizeOriginKB > maxSize)
    {
        imageData = UIImageJPEGRepresentation(newImage, 0.5);
    }
    
    return imageData ;
}

@end
