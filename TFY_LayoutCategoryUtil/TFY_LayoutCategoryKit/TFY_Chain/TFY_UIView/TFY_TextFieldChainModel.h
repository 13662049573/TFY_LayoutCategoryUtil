//
//  TFY_TextFieldChainModel.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_BaseControlChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class TFY_TextFieldChainModel;
@interface TFY_TextFieldChainModel : TFY_BaseControlChainModel<TFY_TextFieldChainModel*>

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ text)(NSString *text);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ attributedText)(NSAttributedString *attributedText);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ font)(UIFont *font);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ textColor)(UIColor *textColor);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ textAlignment)(NSTextAlignment textAlignment);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ borderStyle)(UITextBorderStyle borderStyle);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ defaultTextAttributes)(NSDictionary *defaultTextAttributes);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ placeholder)(NSString *placeholder);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ attributedPlaceholder)(NSAttributedString *attributedPlaceholder);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ clearsOnBeginEditing)(BOOL clearsOnBeginEditing);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ adjustsFontSizeToFitWidth)(BOOL adjustsFontSizeToFitWidth);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ minimumFontSize)(CGFloat minimumFontSize);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ delegate)(id<UITextFieldDelegate> delegate);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ background)(UIImage *background);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ disabledBackground)(UIImage *disabledBackground);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ allowsEditingTextAttributes)(BOOL allowsEditingTextAttributes);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ typingAttributes)(NSDictionary *typingAttributes);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ clearButtonMode)(UITextFieldViewMode clearButtonMode);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ leftView)(UIView *leftView);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ leftViewMode)(UITextFieldViewMode leftViewMode);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ rightView)(UIView *rightView);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ rightViewMode)(UITextFieldViewMode rightViewMode);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ limitLength) (NSUInteger limitLength);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ inputView)(UIView *inputView);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ inputAccessoryView)(UIView *inputAccessoryView);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ placeholderFont)(UIFont *font);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ placeholderColor)(UIColor *color);

#pragma mark - UITextInputTraits -
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ autocapitalizationType)(UITextAutocapitalizationType autocapitalizationType);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ autocorrectionType)(UITextAutocorrectionType autocorrectionType);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ spellCheckingType)(UITextSpellCheckingType spellCheckingType);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ keyboardType)(UIKeyboardType keyboardType);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ keyboardAppearance)(UIKeyboardAppearance keyboardAppearance);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ returnKeyType)(UIReturnKeyType returnKeyType);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ enablesReturnKeyAutomatically)(BOOL enablesReturnKeyAutomatically);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ secureTextEntry)(BOOL secureTextEntry);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ textContentType)(UITextContentType textContentType) API_AVAILABLE(ios(10.0));

@end

TFY_CATEGORY_EXINTERFACE(UITextField, TFY_TextFieldChainModel)

NS_ASSUME_NONNULL_END
