//
// Created by Anastasia on 7/27/16.
//

#import <UIKit/UIKit.h>
#import "TCTableViewContainer.h"

@class TCGist;

@protocol TCCreatingGistViewDelegate <NSObject>
- (void) createGist:(TCGist *)gist;
@end

@interface TCCreatingGistView : TCTableViewContainer
@property (weak, nonatomic) id <TCCreatingGistViewDelegate> delegate;
@end