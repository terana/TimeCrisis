//
// Created by Anastasia on 6/27/16.
//

#import <UIKit/UIKit.h>
#import "TCTableViewContainer.h"

@class TCGist;

@protocol TCGistsListViewDelegate <NSObject>
- (void) gistIsSelected:(TCGist *)gist;
@end

@interface TCGistsListView : TCTableViewContainer
@property (strong, nonatomic) NSArray                    *data;
@property (nonatomic, weak) id <TCGistsListViewDelegate> delegate;
@end