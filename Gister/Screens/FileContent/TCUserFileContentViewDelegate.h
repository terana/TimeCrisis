//
// Created by Anastasia on 7/24/16.
//

#import <UIKit/UIKit.h>

@protocol TCUserFileContentViewDelegate <NSObject>
-(void)renameFile;
-(void)deleteFile;
@end