# imagesbrowser
图片浏览器,YBImageBrowser


#pragma mark - 点击查看图片手势
-(void)tapAction:(UITapGestureRecognizer *)tap{
    
    
    [SDImageBrowserManager showBrowserWithDataSourceArray:self.imagesArray sourceImgView:nil currentIndex:self.pageControl.currentPage];
    
    
}
