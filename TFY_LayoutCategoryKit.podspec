Pod::Spec.new do |spec|

  spec.name         = "TFY_LayoutCategoryKit"

  spec.version      = "2.8.4"

  spec.summary      = "全新链式的界面初始化和界面跳转，布局基于Masonry"

  spec.description  = <<-DESC
                    全新链式的界面初始化和界面跳转，布局基于Masonry
                   DESC

  spec.homepage     = "https://github.com/13662049573/TFY_LayoutCategoryUtil"
  
  spec.license      = "MIT"
  
  spec.author       = { "tfyzxc13662049573" => "420144542@qq.com" }
  
  spec.platform     = :ios, "12.0"

  spec.source       = { :git => "https://github.com/13662049573/TFY_LayoutCategoryUtil.git", :tag => spec.version }

  spec.source_files  = "TFY_LayoutCategoryUtil/TFY_LayoutCategoryKit/*.h"
   
   spec.subspec 'TFY_Tools' do |ss|
     ss.source_files  = "TFY_LayoutCategoryUtil/TFY_LayoutCategoryKit/TFY_Tools/TFY_ToolsHeader.h"

     ss.subspec 'GCD' do |s|
      s.source_files  = "TFY_LayoutCategoryUtil/TFY_LayoutCategoryKit/TFY_Tools/GCD/**/*.{h,m}"
     end

     ss.subspec 'Utils' do |s|
      s.source_files  = "TFY_LayoutCategoryUtil/TFY_LayoutCategoryKit/TFY_Tools/Utils/**/*.{h,m}"
     end

   end

   spec.subspec 'TFY_Categories' do |ss|
      ss.source_files  = "TFY_LayoutCategoryUtil/TFY_LayoutCategoryKit/TFY_Categories/*.h"
      ss.dependency "TFY_LayoutCategoryKit/TFY_Tools/Utils"
      
      ss.subspec 'TFY_Rotating' do |s|
        s.source_files  = "TFY_LayoutCategoryUtil/TFY_LayoutCategoryKit/TFY_Categories/TFY_Rotating/**/*.{h,m}"
       end

      ss.subspec 'TFY_UI' do |s|
       s.source_files  = "TFY_LayoutCategoryUtil/TFY_LayoutCategoryKit/TFY_Categories/TFY_UI/**/*.{h,m}"
      end

      ss.subspec 'TFY_IndexView' do |s|
        s.source_files  = "TFY_LayoutCategoryUtil/TFY_LayoutCategoryKit/TFY_Categories/TFY_IndexView/**/*.{h,m}"
      end
      
      ss.subspec 'TFY_Foundation' do |s|
        s.source_files  = "TFY_LayoutCategoryUtil/TFY_LayoutCategoryKit/TFY_Categories/TFY_Foundation/**/*.{h,m}"
      end

      ss.subspec 'TFY_BadgeView' do |s|
        s.source_files  = "TFY_LayoutCategoryUtil/TFY_LayoutCategoryKit/TFY_Categories/TFY_BadgeView/**/*.{h,m}"
      end

      ss.subspec 'TFY_TextKit' do |s|
        s.source_files  = "TFY_LayoutCategoryUtil/TFY_LayoutCategoryKit/TFY_Categories/TFY_TextKit/**/*.{h,m}"
        s.dependency "TFY_LayoutCategoryKit/TFY_Categories/TFY_Foundation"
      end

      ss.subspec 'TFY_LabelKit' do |s|
        s.source_files  = "TFY_LayoutCategoryUtil/TFY_LayoutCategoryKit/TFY_Categories/TFY_LabelKit/**/*.{h,m}"
        s.dependency "TFY_LayoutCategoryKit/TFY_Categories/TFY_Foundation"
      end

   end

  spec.subspec 'TFY_Chain' do |ss|
      ss.source_files  = "TFY_LayoutCategoryUtil/TFY_LayoutCategoryKit/TFY_Chain/TFY_ChainHeader.h"

      ss.subspec 'TFY_ChainBase' do |s|
        s.source_files  = "TFY_LayoutCategoryUtil/TFY_LayoutCategoryKit/TFY_Chain/TFY_ChainBase/**/*.{h,m}"
      end

      ss.subspec 'TFY_CALayer' do |s|
        s.source_files  = "TFY_LayoutCategoryUtil/TFY_LayoutCategoryKit/TFY_Chain/TFY_CALayer/**/*.{h,m}"
        s.dependency "TFY_LayoutCategoryKit/TFY_Chain/TFY_ChainBase"
        s.dependency "TFY_LayoutCategoryKit/TFY_Categories/TFY_UI"
      end

      ss.subspec 'TFY_UIGesture' do |s|
        s.source_files  = "TFY_LayoutCategoryUtil/TFY_LayoutCategoryKit/TFY_Chain/TFY_UIGesture/**/*.{h,m}"
        s.dependency "TFY_LayoutCategoryKit/TFY_Chain/TFY_ChainBase"
        s.dependency "TFY_LayoutCategoryKit/TFY_Categories/TFY_UI"
      end

      ss.subspec 'TFY_UIView' do |s|
        s.source_files  = "TFY_LayoutCategoryUtil/TFY_LayoutCategoryKit/TFY_Chain/TFY_UIView/**/*.{h,m}"
        s.dependency "TFY_LayoutCategoryKit/TFY_Chain/TFY_ChainBase"
        s.dependency "TFY_LayoutCategoryKit/TFY_Chain/TFY_CALayer"
        s.dependency "TFY_LayoutCategoryKit/TFY_Chain/TFY_UIGesture"
        s.dependency "TFY_LayoutCategoryKit/TFY_Categories/TFY_UI"
        s.dependency "TFY_LayoutCategoryKit/TFY_Categories/TFY_Foundation"
      end
  end

  spec.frameworks    = "Foundation","UIKit"
  
  spec.xcconfig = {"ENABLE_STRICT_OBJC_MSGSEND" => "NO", 'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) COCOAPODS=1 NDEBUG=1 _DEBUG_TAG_'}

  spec.requires_arc  = true

end