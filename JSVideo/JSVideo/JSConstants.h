//
//  JSConstants.h
//  JSVideo
//
//  Created by Javier Saiz Hernansanz on 01/05/14.
//  Copyright (c) 2014 Javier Saiz Hernansanz. All rights reserved.
//

#ifndef JSVideo_JSConstants_h
#define JSVideo_JSConstants_h


#define IS_WIDESCREEN ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define IS_IPHONE ( [ [ [ UIDevice currentDevice ] model ] isEqualToString: @"iPhone" ] )
#define IS_IPOD   ( [ [ [ UIDevice currentDevice ] model ] isEqualToString: @"iPod touch" ] )
#define IS_IPHONE_5 ( IS_IPHONE && IS_WIDESCREEN )


#endif
