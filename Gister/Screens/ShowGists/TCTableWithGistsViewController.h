//
// Created by Anastasia on 6/27/16.
//

#import <UIKit/UIKit.h>
#import "TCGistSelected.h"

@interface TCTableWithGistsViewController : UIViewController <TCGistSelected>
@property (strong, nonatomic) NSURL *gistsURL;
@end