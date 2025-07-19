//
//  RendererAdapter.m
//  TheGameEngine
//
//  Created by Hanna Skairipa on 7/18/25.
//

#import "RendererAdapter.h"

@implementation RendererAdapter
- (void)draw:(id <CAMetalDrawable>) drawable device: (id <MTLDevice>) device
{
  _pRenderer = new Renderer((__bridge CA::MetalDrawable *)drawable, (__bridge MTL::Device *)device);
  _pRenderer->draw();
}
-(void)dealloc
{
  delete _pRenderer;
}
@end
