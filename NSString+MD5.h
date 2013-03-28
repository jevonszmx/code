//
//  NSString+MD5.h
//  NSStringMD5
//
//  
//  Copyright (c) 2011 zmx. All rights reserved.
//  
//

#import <Foundation/Foundation.h>

@interface NSString (MD5)

+ (NSString *)MD5Hash:(NSString *)input;
- (NSString *)MD5Hash;

@end
