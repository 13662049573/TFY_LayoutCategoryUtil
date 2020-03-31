
Pod::Spec.new do |spec|

  spec.name         = "TFY_LayoutCategoryKit"

  spec.version      = "1.0.0"

  spec.summary      = "全新链式的界面初始化和界面跳转，布局基于Masonry"

  spec.description  = <<-DESC
  全新链式的界面初始化和界面跳转，布局基于Masonry
                   DESC

  spec.homepage     = "https://github.com/13662049573/TFY_LayoutCategoryUtil"
  
  spec.license      = "MIT"
  
  spec.author       = { "tfyzxc13662049573" => "420144542@qq.com" }
  
  spec.platform     = :ios, "10.0"

  spec.source       = { :git => "https://github.com/13662049573/TFY_LayoutCategoryUtil.git", :tag => spec.version }

  spec.source_files  = "TFY_LayoutCategoryUtil/TFY_LayoutCategoryKit/TFY_LayoutCategoryHeader.h"
   
  spec.subspec 'TFY_Categories' do |ss|
      ss.source_files  = "TFY_LayoutCategoryUtil/TFY_LayoutCategoryKit/TFY_Categories/TFY_CategoriesHeader.h","TFY_LayoutCategoryUtil/TFY_LayoutCategoryKit/TFY_Categories/TFY_Define.h"

      ss.subspec 'TFY_UI' do |s|
       s.source_files  = "TFY_LayoutCategoryUtil/TFY_LayoutCategoryKit/TFY_Categories/TFY_UI/**/*.{h,m}"
      #  s.dependency "TFY_LayoutCategoryKit/TFY_Tools"
      #  s.dependency "TFY_Categories/TFY_Foundation"
      end

      ss.subspec 'TFY_Foundation' do |s|
        s.source_files  = "TFY_LayoutCategoryUtil/TFY_LayoutCategoryKit/TFY_Categories/TFY_Foundation/**/*.{h,m}"
        # s.dependency "TFY_Categories/TFY_UI"
      end
  end

 spec.subspec 'TFY_Chain' do |ss|
    ss.source_files  = "TFY_LayoutCategoryUtil/TFY_LayoutCategoryKit/TFY_Chain/TFY_ChainHeader.h"

      ss.subspec 'TFY_ChainBase' do |s|
        s.source_files  = "TFY_LayoutCategoryUtil/TFY_LayoutCategoryKit/TFY_Chain/TFY_ChainBase/**/*.{h,m}"
      end

      ss.subspec 'TFY_CALayer' do |s|
        s.source_files  = "TFY_LayoutCategoryUtil/TFY_LayoutCategoryKit/TFY_Chain/TFY_CALayer/**/*.{h,m}"
        # s.dependency "TFY_Chain/TFY_ChainBase"
      end
      ss.subspec 'TFY_UIView' do |s|
        s.source_files  = "TFY_LayoutCategoryUtil/TFY_LayoutCategoryKit/TFY_Chain/TFY_UIView/**/*.{h,m}"
        # s.dependency "TFY_Chain/TFY_ChainBase"
        # s.dependency "TFY_LayoutCategoryKit/TFY_Categories/TFY_UI"
        # s.dependency "TFY_LayoutCategoryKit/TFY_Chain/TFY_CALayer"
        # s.dependency "TFY_LayoutCategoryKit/TFY_Chain/TFY_UIGesture"
      end
      ss.subspec 'TFY_UIGesture' do |s|
        s.source_files  = "TFY_LayoutCategoryUtil/TFY_LayoutCategoryKit/TFY_Chain/TFY_UIGesture/**/*.{h,m}"
        # s.dependency "TFY_Chain/TFY_ChainBase"
        # s.dependency "TFY_LayoutCategoryKit/TFY_Categories/TFY_UI"
      end
 end

 spec.subspec 'TFY_Tools' do |ss|
  ss.source_files  = "TFY_LayoutCategoryUtil/TFY_LayoutCategoryKit/TFY_Tools/**/*.{h,m}"
 end


  spec.frameworks    = "Foundation","UIKit"

  spec.xcconfig      = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/AvailabilityMacros" }

  spec.requires_arc  = true

  spec.dependency "Masonry"

end
