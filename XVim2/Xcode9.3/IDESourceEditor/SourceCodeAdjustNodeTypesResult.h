//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Mar 30 2018 09:30:25).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2015 by Steve Nygard.
//

#import <objc/NSObject.h>

@class DVTDocumentLocation, DVTSourceCodeSymbolKind, NSString;

@interface SourceCodeAdjustNodeTypesResult : NSObject
{
    BOOL _isInProject;
    DVTDocumentLocation *_location;
    NSString *_symbolName;
    DVTSourceCodeSymbolKind *_symbolKind;
}

@property(readonly) BOOL isInProject; // @synthesize isInProject=_isInProject;
@property(readonly) DVTSourceCodeSymbolKind *symbolKind; // @synthesize symbolKind=_symbolKind;
@property(readonly) NSString *symbolName; // @synthesize symbolName=_symbolName;
@property(readonly) DVTDocumentLocation *location; // @synthesize location=_location;
- (void).cxx_destruct;
- (id)initWithLocation:(id)arg1 symbolName:(id)arg2 symbolKind:(id)arg3 isInProject:(BOOL)arg4;

@end

