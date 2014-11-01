//
//  ViewController.m
//  Camera
//
//  Created by shishimo on 2014/11/01.
//  Copyright (c) 2014年 shishimo. All rights reserved.
//

#import "ViewController.h"
#import "GPUImage.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushFilterButton:(id)sender {
    
    // GUIで設定した画像を取得する
    UIImage *inputImage = self.imageView.image;
    
    // 画像をGPUImageのフォーマットに治す
    GPUImagePicture *imagePicture = [[GPUImagePicture alloc] initWithImage:inputImage];
    
    // セピアフィルターを作る
    GPUImageSepiaFilter *sepiaFilter = [[GPUImageSepiaFilter alloc] init];
    
    // イメージをセピアフィルターにくっつける
    [imagePicture addTarget:sepiaFilter];
    
    // 後でキャプチャーすることをフィルターに伝える
    [sepiaFilter useNextFrameForImageCapture];
    
    // フィルターを実行
    [imagePicture processImage];
    
    // 実行したフィルターから、画像を取得する
    UIImage *outputImage = [sepiaFilter imageFromCurrentFramebuffer];
    
    // 取得した画像をセットする
    self.imageView.image = outputImage;

}

- (IBAction)pushSaveButton:(id)sender {
    
    UIImage *image = self.imageView.image;
    
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    
    [library writeImageToSavedPhotosAlbum:image.CGImage
                                 metadata:nil
                          completionBlock:^(NSURL *assetURL, NSError *error){
                              if (!error) {
                                  NSLog(@"保存成功！%@", assetURL);
                              }
                          }
     ];
}

- (IBAction)pushBrendButton:(id)sender {
    
    // GUIで設定した画像を取得する
    UIImage *inputImage = self.imageView.image;
    
    // 画像をGPUImageのフォーマットに治す
    GPUImagePicture *imagePicture = [[GPUImagePicture alloc] initWithImage:inputImage];
    
    // セピアフィルターを作る
    GPUImageSepiaFilter *sepiaFilter = [[GPUImageSepiaFilter alloc] init];
    
    // イメージをセピアフィルターにくっつける
    [imagePicture addTarget:sepiaFilter];
    
    // iPhoneを表示する
    // iPhoneの画像を用意する
    UIImage *iphone = [UIImage imageNamed:@"iphone.png"];
    GPUImagePicture *iphoneImg = [[GPUImagePicture alloc] initWithImage:iphone];
    
    // iPhoneの画像を変形するためのフィルターを作る
    GPUImageTransformFilter *transform = [[GPUImageTransformFilter alloc] init];
    
    // 変形をどうするかを決める
    CGAffineTransform trans;
    trans = CGAffineTransformMakeScale(0.75, 0.75); //　縮小
    trans = CGAffineTransformTranslate(trans, 0, 0.5); // 移動
    [transform setAffineTransform:trans];
    
    // iPhoneの画像を変形する
    [iphoneImg addTarget:transform];
    
    // 画像を合成するためのブレンドモードを作る
    GPUImageNormalBlendFilter *normalBlend = [[GPUImageNormalBlendFilter alloc] init];
    
    // 後でキャプチャーすることをフィルターに伝える
    [normalBlend useNextFrameForImageCapture];
    
    // ブレンドする
    // imagePictureはsepiaFilter -> normalBlendの順にフィルターをかけていくイメージなので、
    // sepiaFilterにnormalBlendをaddTargetする
    [sepiaFilter addTarget:normalBlend]; // こっちがブレンドの下になる画像
    
    // iphoneImgはtransform -> normalBlendの順にかけていくイメージ
    [transform addTarget:normalBlend atTextureLocation:1]; // こっちが上になる画像
    
    // フィルターを実行
    [imagePicture processImage];
    [iphoneImg processImage];
    
    // 実行したフィルターから、画像を取得する
    UIImage *outputImage = [normalBlend imageFromCurrentFramebuffer];
    
    // 取得した画像をセットする
    self.imageView.image = outputImage;
}
@end