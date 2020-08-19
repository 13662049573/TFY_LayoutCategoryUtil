//
//  TFY_TextViewChainModel.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_BaseScrollViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class TFY_TextViewChainModel;
@interface TFY_TextViewChainModel : TFY_BaseScrollViewChainModel<TFY_TextViewChainModel *>

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ delegate)(id<UITextViewDelegate>);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ text)(NSString *);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ font)(UIFont *);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ textColor)(UIColor *);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ textAlignment)(NSTextAlignment);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ selectedRange)(NSRange);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ editable)(BOOL);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ selectable)(BOOL);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ dataDetectorTypes)(UIDataDetectorTypes);


TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ allowsEditingTextAttributes)(BOOL);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ attributedText)(NSAttributedString *);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ typingAttributes)(NSDictionary *);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ clearsOnInsertion)(BOOL);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ textContainerInset)(UIEdgeInsets);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ linkTextAttributes)(NSDictionary *);
#pragma mark - UITextInputTraits -
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ autocapitalizationType)(UITextAutocapitalizationType);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ autocorrectionType)(UITextAutocorrectionType);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ spellCheckingType)(UITextSpellCheckingType);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ keyboardType)(UIKeyboardType);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ keyboardAppearance)(UIKeyboardAppearance);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ returnKeyType)(UIReturnKeyType);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ enablesReturnKeyAutomatically)(BOOL);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ secureTextEntry)(BOOL);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ textContentType)(UITextContentType) API_AVAILABLE(ios(10));
@end

TFY_CATEGORY_EXINTERFACE(UITextView, TFY_TextViewChainModel)

NS_ASSUME_NONNULL_END
