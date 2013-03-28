//
//  MyScrollView.h
//  TouchScrollView
//  使用UISCrollView的viewController只要#import "MyScrollView.h"即可
//  Copyright 2013 zmx. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIScrollView (my) 
    
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;

@end
