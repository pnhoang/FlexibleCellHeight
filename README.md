# Introduction

This project demonstrate the use of a customize UITextView to calculate the height of the text that it contains and then use that height as the height for UITableView. Each element is added, the height for that cell will be calculated. 

The function to calculate the height of the text in UITextView is simple:

	+ (CGFloat)viewHeightForBodyString:(NSString *)body constraintSize: (CGSize) constraintSize
	{
		CGRect rect = [body boundingRectWithSize: constraintSize options:NSStringDrawingUsesLineFragmentOrigin attributes: @{NSFontAttributeName: [UIFont systemFontOfSize: MESSAGE_FONT_SIZE]} context: nil];
		
		return rect.size.height;
	}

