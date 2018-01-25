//
//  Header.h
//  PractiseDemo
//
//  Created by gz on 2018/1/24.
//  Copyright © 2018年 gz. All rights reserved.
//

#ifndef Header_h
#define Header_h

#ifdef DEBUG

#define MyLog(...) NSLog(__VA_ARGS__)

#else


#endif

/// 数据请求单例类
#define AFNetWorkingRequestTool [AFNetWorkingRequestManager shareManager]

#endif /* Header_h */
