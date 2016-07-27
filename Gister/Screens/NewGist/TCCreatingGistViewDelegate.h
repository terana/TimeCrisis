//
// Created by Anastasia on 7/27/16.
//

#import <Foundation/Foundation.h>

@class TCGist;

@protocol TCCreatingGistViewDelegate <NSObject>
-(void)createGist:(TCGist *) gist;
@end