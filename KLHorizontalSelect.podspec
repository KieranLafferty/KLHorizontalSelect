Pod::Spec.new do |s|
  s.name         	= "KLHorizontalSelect"
  s.version      	= "0.0.1"
  s.platform		= :ios, '5.0'
  s.summary      	= "Scroll left and right on the section scroller to make a selection. Inspiration for this project came from 8tracks iPhone application"
  s.homepage     	= "http://www.cocoacontrols.com/platforms/ios/controls/klhorizontalselect"
  s.license      	= 'Apache 2.0'
  s.author       	= { "Kieran Lafferty" => "kieran.lafferty@gmail.com"}
  s.source       	= { :git => "https://github.com/KieranLafferty/KLNoteViewController.git", :commit => "d6ff5b12b46ec1be3d75157faa197661fb7d57a3" }
  s.source_files 	= 'Classes/*.{h,m}'
  s.requires_arc 	= true
end