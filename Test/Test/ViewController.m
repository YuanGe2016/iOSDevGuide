//
//  ViewController.m
//  Test
//
//  Created by Bytedance on 2020/7/14.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import "ViewController.h"

@interface Car : NSObject
@property(nonatomic,strong)NSString *name;
@end
@implementation Car
+(Car *)initWithName:(NSString *)name{
    Car *car = [[Car alloc] init];
    car.name = name;
    return car;
}
@end

@interface Person : NSObject
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)Car *car;
@property(nonatomic,assign)NSInteger age;
@end
@implementation Person
 
+(Person *)personWithAge:(int)age withName:(NSString *)name withCar:(Car *)car{
    Person *person = [[Person alloc] init];
    person.age = age;
    person.name = name;
    person.car = car;
    return person;
}
//这里重写description方法，用于最后测试排序结果显示
-(NSString *)description{
    return [NSString stringWithFormat:@"age is %zi , name is %@, car is %@",_age,_name,_car.name];
}
@end


@interface ljyObject : NSObject

@property(nonatomic, copy)NSString* name;
@property(nonatomic, assign)NSInteger length;
@property(nonatomic, strong)NSNumber *age;

- (instancetype)initWithNamen:(NSString*) n;

@end

@implementation ljyObject

- (instancetype)initWithNamen:(NSString*) n
{
    self = [super init];
    if(self) {
        NSString *nn = [NSString stringWithString:n];
        self.name = nn;
    }
    return self;
}

@end

@interface ViewController ()

@property(nonatomic, strong)ljyObject *ljy;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *testString = @"LJY is a hero";
    NSRange range = [testString rangeOfString:@"LJ"];
    NSLog(@"%ld,%ld",range.location,range.length);
    
    //[[NSUserDefaults standardUserDefaults] setDouble:216.6 forKey:@"mymoney"];
    [self getUserde];
    
    self.ljy = [[ljyObject alloc] initWithNamen:@"lujiayuan"];
    //self.ljy.length = [NSString stringWithString: [self.ljy valueForKey:@"name"]];
    NSNumber *age = [NSNumber numberWithInt:25];
    [self.ljy setValue:age forKey:@"age"];
    //self.ljy.length = [self.ljy valueForKeyPath:@"name.length"];
    self.ljy.length = 9;
    NSLog(@"%@, %ld, %@",self.ljy.name, self.ljy.length, [self.ljy valueForKey:@"age"]);
    
    //NSDictionary *enviroments = [[NSProcessInfo processInfo] environment];
    //NSLog(@"enviroments : \n%@",enviroments);
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        NSLog(@"current thread : %@", [NSThread currentThread]);
        int *arry = (int *)malloc(sizeof(int) * 10);
        for(int i = 0; i < 10; i++)
            arry[i] = i;
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(){
       NSLog(@"current thread : %@", [NSThread currentThread]);
    });
    
    NSLog(@"current thread : %@", [NSThread currentThread]);

    //测试排序算法
    [self sortArray];
}

- (IBAction)clicked:(id)sender
{
    double mymoney = [[NSUserDefaults standardUserDefaults] doubleForKey:@"mymoney"];
    NSLog(@"%f",mymoney);
}

- (void)getUserde
{
    double mymoney = [[NSUserDefaults standardUserDefaults] doubleForKey:@"mymoney"];
    NSLog(@"%f",mymoney);
}

- (void)sortArray
{
        //首先来3辆车，分别是奥迪、劳斯莱斯、宝马
        Car *car1 = [Car initWithName:@"Audio"];
        Car *car2 = [Car initWithName:@"Rolls-Royce"];
        Car *car3 = [Car initWithName:@"BMW"];
         
        //再来5个Person，每人送辆车，分别为car2、car1、car1、car3、car2
        Person *p1 = [Person personWithAge:23 withName:@"zhangsan" withCar:car2];
        Person *p2 = [Person personWithAge:21 withName:@"zhangsan" withCar:car1];
        Person *p3 = [Person personWithAge:24 withName:@"lisi" withCar:car1];
        Person *p4 = [Person personWithAge:23 withName:@"wangwu" withCar:car3];
        Person *p5 = [Person personWithAge:23 withName:@"wangwu" withCar:car2];
 
     
        //加入数组
        NSArray *array = [NSArray arrayWithObjects:p1,p2,p3,p4,p5, nil];
         
        //构建排序描述器
        NSSortDescriptor *carNameDesc = [NSSortDescriptor sortDescriptorWithKey:@"car.name" ascending:YES];
        NSSortDescriptor *personNameDesc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
        NSSortDescriptor *personAgeDesc = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:YES];
         
        //把排序描述器放进数组里，放入的顺序就是你想要排序的顺序
        //我这里是：首先按照年龄排序，然后是车的名字，最后是按照人的名字
        NSArray *descriptorArray = [NSArray arrayWithObjects:personAgeDesc,carNameDesc,personNameDesc, nil];
         
        NSArray *sortedArray = [array sortedArrayUsingDescriptors: descriptorArray];
        NSLog(@"%@",sortedArray);
}
@end
