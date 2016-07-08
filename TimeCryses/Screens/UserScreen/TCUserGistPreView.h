//
// Created by Anastasia on 7/7/16.
//

#import <UIKit/UIKit.h>
#import "TCUserInformatiobSelection.h"

@interface TCUserGistPreView : UIView
@property (strong, nonatomic) NSArray                                 *gistsArray;
@property (nonatomic, weak, nullable) id <TCUserInformatiobSelection> delegate;
@end