//
//  ViewController.m
//  homework_1_ocBasics
//
//  Created by LuJiayuan666 on 2020/7/15.
//  Copyright © 2020 LuJiayuan666. All rights reserved.
//

#import "ViewController.h"
#import "personMesModel.h"

#define REPEAT_TIMES 1000

@interface ViewController ()

@property(nonatomic)NSData *data; //json数据
@property(nonatomic)NSDictionary *typeAndMessageDic; //存放解析结果

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Hello world!");

    [self createDataFromLocalFile];
    [self createTypeAndMessageDic];
    [self transferJsonToModel];
}

#pragma mark - 初始化
- (void)createDataFromLocalFile
{
    NSString *myBundlePath = [[NSBundle mainBundle] pathForResource:@"JsonBundle" ofType:@"bundle"];
    NSString *myJsonFilePath = [[NSBundle bundleWithPath:myBundlePath] pathForResource:@"test" ofType:@"json"];
    self.data = [NSData dataWithContentsOfFile:myJsonFilePath];
}

- (void)createTypeAndMessageDic
{
    //把各个库的方法再次封装，以NSString表示，使用时再转回SEL；以后扩展的时候，除了添加新增库的方法，只需在这个字典里新增相应的一个元素即可
    self.typeAndMessageDic = @{@"Manual":[[ResultModel alloc]initWithFunctionName:@"useNSJSONToAnalyWithData"],
                               @"JSONModel":[[ResultModel alloc]initWithFunctionName:@"useJSONModelWithData"],
                               @"YYModel":[[ResultModel alloc]initWithFunctionName:@"useYYModelWithData"],
                               @"MJExtension":[[ResultModel alloc]initWithFunctionName:@"useMJExtensionWithData"]
    };
}

#pragma mark - 运行处理
- (void)transferJsonToModel
{
    if(self.data == nil || self.typeAndMessageDic == nil) {
        NSLog(@"Data or dictionary is nil...");
        return;
    }
    
    [self.typeAndMessageDic enumerateKeysAndObjectsUsingBlock:^(NSString *key, ResultModel *obj, BOOL * _Nonnull stop) {
        SEL sel = NSSelectorFromString(obj.funcName);
        obj.messageModel = [self performSelector:sel];
        
        CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
        for(int i = 0; i < REPEAT_TIMES; i++) {
            @autoreleasepool {
                PersonMessageModel *temp = [self performSelector:sel];
            };
        }
        CFAbsoluteTime end = CFAbsoluteTimeGetCurrent();
        double costTime = (end - start) * 1000.0 / REPEAT_TIMES;
        obj.costTime = [NSString stringWithFormat:@"%f ms", costTime];
        
        NSLog(@"%@:\n%@\n",key,obj.messageModel);
    }];
    
    [self.typeAndMessageDic enumerateKeysAndObjectsUsingBlock:^(NSString *key, ResultModel *obj, BOOL * _Nonnull stop) {
        NSLog(@"%@ costs time : %@",key, obj.costTime);
    }];
}

#pragma mark - 具体解析方法
- (PersonMessageModel *)useNSJSONToAnalyWithData
{
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:self.data options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *mediadic = dic[@"media_info"];
    MediaInfoModel *mediainfomodel = [[MediaInfoModel alloc]init];
    mediainfomodel.avatar_url = mediadic[@"avatar_url"];
    mediainfomodel.name = mediadic[@"name"];
    mediainfomodel.user_verified = mediadic[@"user_verified"];
    mediainfomodel.verified_content = mediadic[@"verified_content"];
    
    PersonMessageModel *myMesModel = [[PersonMessageModel alloc] init];
    myMesModel.content = dic[@"content"];
    myMesModel.image_url = dic[@"image_url"];
    myMesModel.comment_count = [dic[@"comment_count"] integerValue];
    myMesModel.like_count = [dic[@"like_count"] integerValue];
    myMesModel.share_count = [dic[@"share_count"] integerValue];
    myMesModel.media_info = mediainfomodel;
    
    return myMesModel;
}

- (PersonMessageModel *)useJSONModelWithData
{
    NSError *error;
    PersonMessageModel *myMesModel = [[PersonMessageModel alloc] initWithData:self.data error:&error];
    return myMesModel;
}

- (PersonMessageModel *)useYYModelWithData
{
    PersonMessageModel *myMesModel = [PersonMessageModel yy_modelWithJSON:self.data];
    return myMesModel;
}

- (PersonMessageModel *)useMJExtensionWithData
{
    PersonMessageModel *myMesModel = [PersonMessageModel mj_objectWithKeyValues:self.data];
    return myMesModel;
}

@end
