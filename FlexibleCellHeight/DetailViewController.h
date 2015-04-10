//
//  DetailViewController.h
//  FlexibleCellHeight
//
//  Created by Hoang Pham on 4/9/15.
//  Copyright (c) 2015 Hoang Pham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

