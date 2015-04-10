//
//  TextView.m
//  FlexibleCellHeight
//
//  Created by Hoang Pham on 4/9/15.
//  Copyright (c) 2015 Hoang Pham. All rights reserved.
//

#import "TextView.h"

#define MESSAGE_FONT_SIZE					(17)
#define DETAIL_TEXT_LABEL_WIDTH (220.0)

@implementation TextView

- (instancetype)init
{
	if (self = [super init]) {
	}
	return self;
}

- (void)setBody:(NSString *)bodyText
{
	_body = bodyText;
	
	NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[bodyText dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
	self.attributedText = attributedString;
}

+ (CGFloat)viewHeightForBodyString:(NSString *)body constraintSize: (CGSize) constraintSize
{
	CGRect rect = [body boundingRectWithSize: constraintSize options:NSStringDrawingUsesLineFragmentOrigin attributes: @{NSFontAttributeName: [UIFont systemFontOfSize: MESSAGE_FONT_SIZE]} context: nil];
	
	return rect.size.height;
}

@end
