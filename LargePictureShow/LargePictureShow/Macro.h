//
//  Macro.h
//  LargePictureShow
//
//  Created by modong on 2017/12/6.
//  Copyright © 2017年 modong. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

#define isiPhoneX (([[UIScreen mainScreen] bounds].size.height)==812.f ? 1 : 0)
#define TAB_HEIGHT 49
#define NAV_HEIGHT 44
#define STATUS_HEIGHT (isiPhoneX ? 44 : 20)
#define STATUS_ZERO (isiPhoneX ? 22 : 0)
#define VirtualHomeForiPhoneX   (isiPhoneX ? 34 : 0)

#endif /* Macro_h */
