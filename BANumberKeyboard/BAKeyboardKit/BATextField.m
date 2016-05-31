//
//  BATextField.m
//  BANumberKeyboard
//
//  Created by abel on 15/4/24.
//  Copyright (c) 2015年 abel. All rights reserved.
//

#import "BATextField.h"
#import "BANumberKeyboard.h"

@implementation UITextField (ExtentRange)

- (NSRange)selectedRange {
    UITextPosition* beginning = self.beginningOfDocument;
    
    UITextRange* selectedRange = self.selectedTextRange;
    UITextPosition* selectionStart = selectedRange.start;
    UITextPosition* selectionEnd = selectedRange.end;
    
    const NSInteger location = [self offsetFromPosition:beginning toPosition:selectionStart];
    const NSInteger length = [self offsetFromPosition:selectionStart toPosition:selectionEnd];
    
    return NSMakeRange(location, length);
}

- (void)setSelectedRange:(NSRange)range {
    UITextPosition* beginning = self.beginningOfDocument;
    
    UITextPosition* startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition* endPosition = [self positionFromPosition:beginning offset:range.location + range.length];
    UITextRange* selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
    
    [self setSelectedTextRange:selectionRange];
}

@end

@interface BATextField () <BANumberKeyboardDelegate> {
    BANumberKeyboard * numberKeyboard;
}

@end

@implementation BATextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    numberKeyboard = [[BANumberKeyboard alloc] init];
    self.inputView = numberKeyboard;
    numberKeyboard.delegate = self;
    [numberKeyboard createdKeyboard];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if ( self = [super initWithFrame:frame]) {
        [self awakeFromNib];
    }
    return self;
}

#pragma mark - BANumberKeyboardDelegate
-(BOOL)textFieldShouldReturn:(BANumberKeyboard *)numberKeyboard {
    if ([self.delegate respondsToSelector:@selector(textFieldShouldReturn:)]) {
        [self.delegate textFieldShouldReturn:self];
    }
    return YES;
}

- (BOOL)textFieldShouldDelete:(BANumberKeyboard *)numberKeyboard {
    BOOL canEditor = YES;
    if ([self.delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        canEditor = [self.delegate textField:self shouldChangeCharactersInRange:self.selectedRange replacementString:@""];
    }
    if (canEditor) {
        [self deleteBackward];
    }
    return canEditor;
}

- (void)numberKeyboard:(BANumberKeyboard *)numberKeyboard replacementString:(NSString *)string {
    BOOL canEditor = YES;
    if ([self.delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        canEditor = [self.delegate textField:self shouldChangeCharactersInRange:self.selectedRange replacementString:string];
    }
    
    if (canEditor) {
        [self replaceRange:self.selectedTextRange withText:string];
    }
}

-(void)keyboardButtonOnclick {
    [self resignFirstResponder];
}

- (void)setKeyboardType:(BAKeyboardType)keyboardType {
    switch (keyboardType) {
        case BAKeyboardTypeDefault:
            self.inputView = nil;
            break;
            case BAKeyboardTypeNumber:
            self.inputView = numberKeyboard;
            break;
        default:
            break;
    }
}

- (void)setNumberKeyboardType:(BANumberKeyboardType)numberKeyboardType {
    _numberKeyboardType = numberKeyboardType;
    numberKeyboard = [[BANumberKeyboard alloc] init];
    self.inputView = numberKeyboard;
    numberKeyboard.delegate = self;
    [numberKeyboard createdKeyboard];
}

- (BANumberKeyboardType)numberKeyboardType:(BANumberKeyboard *)numberKeyboard {
    return self.numberKeyboardType;
}


@end




