//
// Created by Anastasia on 7/27/16.
//

#import <UIKit/UIKit.h>
#import "TCTableViewContainer.h"

@protocol TCCreatingGistViewDelegate;

@interface TCCreatingGistView : TCTableViewContainer
@property (weak, nonatomic) id <TCCreatingGistViewDelegate> delegate;
@end