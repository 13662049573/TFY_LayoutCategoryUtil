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

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ delegate)(id<UITextViewDelegate> delegate);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ text)(NSString *text);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ font)(UIFont *font);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ textColor)(UIColor *textColor);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ textAlignment)(NSTextAlignment textAlignment);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ selectedRange)(NSRange numberOfLines);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ editable)(BOOL editable);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ selectable)(BOOL selectable);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ dataDetectorTypes)(UIDataDetectorTypes dataDetectorTypes);


TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ allowsEditingTextAttributes)(BOOL allowsEditingTextAttributes);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ attributedText)(NSAttributedString *attributedText);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ typingAttributes)(NSDictionary *typingAttributes);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ clearsOnInsertion)(BOOL clearsOnInsertion);

TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ textContainerInset)(UIEdgeInsets textContainerInset);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ linkTextAttributes)(NSDictionary *linkTextAttributes);
#pragma mark - UITextInputTraits -
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ autocapitalizationType)(UITextAutocapitalizationType autocapitalizationType);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ autocorrectionType)(UITextAutocorrectionType autocorrectionType);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ spellCheckingType)(UITextSpellCheckingType spellCheckingType);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ keyboardType)(UIKeyboardType keyboardType);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ keyboardAppearance)(UIKeyboardAppearance keyboardAppearance);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ returnKeyType)(UIReturnKeyType returnKeyType);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ enablesReturnKeyAutomatically)(BOOL enablesReturnKeyAutomatically);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ secureTextEntry)(BOOL secureTextEntry);
TFY_CATEGORY_CHAIN_PROPERTY TFY_TextViewChainModel *(^ textContentType)(UITextContentType textContentType) API_AVAILABLE(ios(10));
@end

TFY_CATEGORY_EXINTERFACE(UITextView, TFY_TextViewChainModel)

NS_ASSUME_NONNULL_END
