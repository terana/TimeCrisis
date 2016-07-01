//
// Created by Anastasia on 7/1/16.
//

#import <UIKit/UIKit.h>
#import "TCGist.h"

@protocol TCGistSelected <NSObject>
- (void) gistIsSelected: (TCGist *) gist;
@end