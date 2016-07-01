//
// Created by Anastasia on 6/27/16.
//

#import <UIKit/UIKit.h>
#import "TCGistSelected.h"

@interface TCViewWithGistTable : UIView
@property (strong, nonatomic) NSArray *data;
@property (nonatomic, weak, nullable) id  <TCGistSelected> delegate;
@end