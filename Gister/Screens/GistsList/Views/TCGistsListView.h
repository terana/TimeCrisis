//
// Created by Anastasia on 6/27/16.
//

#import <UIKit/UIKit.h>
#import "TCGistsListViewDelegate.h"
#import "TCTableViewContainer.h"

@interface TCGistsListView : TCTableViewContainer
@property (strong, nonatomic) NSArray                     *data;
@property (nonatomic, weak, nullable) id <TCGistsListViewDelegate> delegate;
@end