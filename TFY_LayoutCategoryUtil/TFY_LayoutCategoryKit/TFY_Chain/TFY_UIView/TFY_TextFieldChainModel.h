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

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ text)(NSString *);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ attributedText)(NSAttributedString *);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ font)(UIFont *);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ textColor)(UIColor *);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ textAlignment)(NSTextAlignment);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ borderStyle)(UITextBorderStyle);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ defaultTextAttributes)(NSDictionary *);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ placeholder)(NSString *);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ attributedPlaceholder)(NSAttributedString *);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ clearsOnBeginEditing)(BOOL);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ adjustsFontSizeToFitWidth)(BOOL);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ minimumFontSize)(CGFloat);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ delegate)(id<UITextFieldDelegate>);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ background)(UIImage *);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ disabledBackground)(UIImage *);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ allowsEditingTextAttributes)(BOOL);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ typingAttributes)(NSDictionary *);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ clearButtonMode)(UITextFieldViewMode);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ leftView)(UIView *);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ leftViewMode)(UITextFieldViewMode);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ rightView)(UIView *);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ rightViewMode)(UITextFieldViewMode);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ limitLength) (NSUInteger);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ inputView)(UIView *);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ inputAccessoryView)(UIView *);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ placeholderColor)(UIColor *);

#pragma mark - UITextInputTraits -
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ autocapitalizationType)(UITextAutocapitalizationType);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ autocorrectionType)(UITextAutocorrectionType);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ spellCheckingType)(UITextSpellCheckingType);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ keyboardType)(UIKeyboardType);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ keyboardAppearance)(UIKeyboardAppearance);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ returnKeyType)(UIReturnKeyType);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ enablesReturnKeyAutomatically)(BOOL);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ secureTextEntry)(BOOL);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextFieldChainModel *(^ textContentType)(UITextContentType) API_AVAILABLE(ios(10.0));

@end

TFY_CATEGORY_EXINTERFACE(UITextField, TFY_TextFieldChainModel)

NS_ASSUME_NONNULL_END
