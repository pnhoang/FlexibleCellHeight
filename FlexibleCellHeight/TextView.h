//
//  TextView.h
//  FlexibleCellHeight
//
//  Created by Hoang Pham on 4/9/15.
//  Copyright (c) 2015 Hoang Pham. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TEXTVIEW_TAG (100)

@interface TextView : UITextView

@property (nonatomic, strong) NSString *body;

+ (CGFloat) viewHeightForBodyString: (NSString *) body constraintSize: (CGSize) constraintSize;

@end
