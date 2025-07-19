//
//  RendererAdapter.h
//  TheGameEngine
//
//  Created by Hanna Skairipa on 7/18/25.
//

#ifndef RendererAdapter_h
#define RendererAdapter_h

#import "QuartzCore/CAMetalLayer.h"
#import "Metal/MTLDevice.h"
#import "Renderer.hpp"

@interface RendererAdapter : NSObject
{
  Renderer * _pRenderer;
}
-(void)draw:(id <CAMetalDrawable>) drawable device: (id <MTLDevice>) device;
@end

#endif /* RendererAdapter_h */
