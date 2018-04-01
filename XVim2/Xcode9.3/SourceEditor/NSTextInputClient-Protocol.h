//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Mar 30 2018 09:30:25).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2015 by Steve Nygard.
//

@class NSArray, NSAttributedString;

@protocol NSTextInputClient
- (long long)characterIndexForPoint:(struct CGPoint)arg1;
- (struct CGRect)firstRectForCharacterRange:(struct _NSRange)arg1 actualRange:(struct _NSRange *)arg2;
- (NSArray *)validAttributesForMarkedText;
- (NSAttributedString *)attributedSubstringForProposedRange:(struct _NSRange)arg1 actualRange:(struct _NSRange *)arg2;
- (BOOL)hasMarkedText;
- (struct _NSRange)markedRange;
- (struct _NSRange)selectedRange;
- (void)unmarkText;
- (void)setMarkedText:(id)arg1 selectedRange:(struct _NSRange)arg2 replacementRange:(struct _NSRange)arg3;
- (void)doCommandBySelector:(SEL)arg1;
- (void)insertText:(id)arg1 replacementRange:(struct _NSRange)arg2;

@optional
- (BOOL)drawsVerticallyForCharacterAtIndex:(long long)arg1;
- (long long)windowLevel;
- (double)baselineDeltaForCharacterAtIndex:(long long)arg1;
- (double)fractionOfDistanceThroughGlyphForPoint:(struct CGPoint)arg1;
- (NSAttributedString *)attributedString;
@end

