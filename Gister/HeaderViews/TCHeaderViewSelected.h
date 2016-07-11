//
// Created by Anastasia on 7/10/16.
//

#import <UIKit/UIKit.h>

@protocol TCHeaderViewSelected <NSObject>
- (void) loadMainUserScreen;
- (void) loadResentGistsScreen;
-(void) loadCreationGistScreen;
-(void) signOut;
@end