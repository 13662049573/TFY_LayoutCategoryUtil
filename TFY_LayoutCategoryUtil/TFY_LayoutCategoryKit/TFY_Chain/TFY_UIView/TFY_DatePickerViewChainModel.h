//
//  TFY_DatePickerViewChainModel.h
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_BaseControlChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class TFY_DatePickerViewChainModel;
@interface TFY_DatePickerViewChainModel : TFY_BaseControlChainModel<TFY_DatePickerViewChainModel *>
TFY_CATEGORY_CHAIN_PROPERTY TFY_DatePickerViewChainModel * (^ datePickerMode) (UIDatePickerMode datePickerMode);
TFY_CATEGORY_CHAIN_PROPERTY TFY_DatePickerViewChainModel * (^ locale) (NSLocale* locale);
TFY_CATEGORY_CHAIN_PROPERTY TFY_DatePickerViewChainModel * (^ calendar) (NSCalendar* calendar);
TFY_CATEGORY_CHAIN_PROPERTY TFY_DatePickerViewChainModel * (^ timeZone) (NSTimeZone* timeZone);
TFY_CATEGORY_CHAIN_PROPERTY TFY_DatePickerViewChainModel * (^ date) (NSDate * date);
TFY_CATEGORY_CHAIN_PROPERTY TFY_DatePickerViewChainModel * (^ minimumDate) (NSDate * minimumDate);
TFY_CATEGORY_CHAIN_PROPERTY TFY_DatePickerViewChainModel * (^ maximumDate) (NSDate * maximumDate);
TFY_CATEGORY_CHAIN_PROPERTY TFY_DatePickerViewChainModel * (^ countDownDuration) (NSTimeInterval countDownDuration);
TFY_CATEGORY_CHAIN_PROPERTY TFY_DatePickerViewChainModel * (^ minuteInterval) (NSInteger minuteInterval);
TFY_CATEGORY_CHAIN_PROPERTY TFY_DatePickerViewChainModel * (^ setDateWithAnimated) (NSDate *date, BOOL animated);
@end
TFY_CATEGORY_EXINTERFACE(UIDatePicker, TFY_DatePickerViewChainModel)
NS_ASSUME_NONNULL_END
