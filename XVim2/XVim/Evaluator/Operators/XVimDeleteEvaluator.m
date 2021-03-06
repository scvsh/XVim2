//
//  XVimDeleteEvaluator.m
//  XVim
//
//  Created by Shuichiro Suzuki on 2/25/12.
//  Copyright (c) 2012 JugglerShu.Net. All rights reserved.
//

#import "XVimDeleteEvaluator.h"
#import "XVimInsertEvaluator.h"
#import "XVimWindow.h"
#import "Logger.h"
#import "SourceCodeEditorViewProxy.h"
#import "XVim.h"
#import "XVimTextObjectEvaluator.h"

@interface XVimDeleteEvaluator () {
    BOOL _insertModeAtCompletion;
}
@end

@implementation XVimDeleteEvaluator

- (id)initWithWindow:(XVimWindow*)window insertModeAtCompletion:(BOOL)insertModeAtCompletion
{
    if (self = [super initWithWindow:window]) {
        _insertModeAtCompletion = insertModeAtCompletion;
    }
    return self;
}


- (XVimEvaluator*)c
{
    if (!_insertModeAtCompletion) {
        return nil; // 'dc' does nothing
    }
    // 'cc' should obey the repeat specifier
    // '3cc' should delete/cut the current line and the 2 lines below it

    if ([self numericArg] < 1)
        return nil;

    XVimMotion* m = XVIM_MAKE_MOTION(MOTION_LINE_FORWARD, LINEWISE, MOPT_NONE, [self numericArg] - 1);
    return [self _motionFixed:m];
}

- (XVimEvaluator*)d
{
    if (_insertModeAtCompletion) {
        return nil; // 'cd' does nothing
    }
    // 'dd' should obey the repeat specifier
    // '3dd' should delete/cut the current line and the 2 lines below it

    if ([self numericArg] < 1)
        return nil;

    XVimMotion* m = XVIM_MAKE_MOTION(MOTION_LINE_FORWARD, LINEWISE, MOPT_NONE, [self numericArg] - 1);
    return [self _motionFixed:m];
}

- (XVimEvaluator*)UNDERSCORE
{
    if (!_insertModeAtCompletion) {
        return [self d];
    }
    else {
        return [self c];
    }
}

- (XVimEvaluator*)motionFixed:(XVimMotion*)motion
{
    if (_insertModeAtCompletion) {
        // Do not repeat the insert, that is how vim works so for
        // example 'c3wWord<ESC>' results in Word not WordWordWord
        if (![[self sourceView] xvim_change:motion]) {
            return nil;
        }
        [self resetNumericArg];
        // Do not call [[XVim instance] fixRepeatCommand] here.
        // It will be called after XVimInsertEvaluator finish handling key input.
        return [[XVimInsertEvaluator alloc] initWithWindow:self.window];
    }
    else {
        [[self sourceView] xvim_delete:motion andYank:YES];
    }
    return nil;
}

@end
