
Pod::Spec.new do |s|

  s.name         = "JWCategorys"
  s.version      = "0.0.9"
  s.summary      = "开发过程中发现的、收集的、编写的一些有用的类别"


  s.description = 'UIImage+JWQRImage 图片处理的一个类别，用于快速的生成二维码 '      \
                  'UIColor+JWHexColor 颜色处理的一个类别，方便处理颜色 '  \
                  'NSDate+JWTime 日期处理类别，有许多常用方法  '  \
                  'UIButton+JWEnlargeEdge 动态的增加按钮点击范围' \
                  'UINavigationItem+JWMargin 导航按钮偏移处理' \
                  'NSSet+JWUnicode 、NSArray+JWUnicode 、NSDictionary+JWUnicode 中文字符打印问题' \
                  'UIWindow+JWScreenshots 屏幕截图方法' \
                  'NSString+JWDecimalCalculation 高精度计算'
  #主页
  s.homepage     = "https://github.com/junwangInChina/JWCategorys"
  #证书申明
  s.license      = { :type => 'MIT', :file => 'LICENSE' }


  #作者
  s.author       = { "wangjun" => "github_work@163.com" }
  #支持版本
  s.platform     = :ios, "7.0"
  #版本地址
  s.source       = { :git => "https://github.com/junwangInChina/JWCategorys.git", :tag => s.version }
 

  #库文件路径（相对于.podspec文件的路径）
  s.source_files  = "JWCategorysDemo/JWCategorys/**/*.{h,m}"
  #是否支持arc
  s.requires_arc = true
 



end
