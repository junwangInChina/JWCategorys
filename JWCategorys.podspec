
Pod::Spec.new do |s|

  s.name         = "JWCategorys"
  s.version      = "0.1.1"
  s.summary      = '常用的一些类别，包括日期处理、字符串比较、hex转颜色、通过颜色生成图片、快速截图等'


  s.description = <<-DESC
                    NSString+JWDecimalCalculation 高精度计算; 

                    UIButton+JWEnlargeEdge 动态的增加按钮点击范围;
                    UIButton+JWImagePosition 动态调整按钮图文位置;

                    UIColor+JWHexColor 通过hex字符串获取颜色、反色等;

                    NSDate+JWTime 日期处理类别，有许多常用方法; 

                    UIImage+JWQRImage 便捷生成二维码;
                    UIImage+JWColor 通过颜色色值，生成纯色图片;

                    UINavigationItem+JWMargin 导航按钮偏移处理;

                    NSSet+JWUnicode 、NSArray+JWUnicode 、NSDictionary+JWUnicode 中文字符打印问题;

                    UIWindow+JWScreenshots 快速截图;

                  DESC

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
