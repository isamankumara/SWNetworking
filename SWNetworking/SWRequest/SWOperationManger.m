//
//  SWOperationManger.m
//  SWNetworking
//
//  Created by Saman Kumara on 4/6/15.
//  Copyright (c) 2015 Saman Kumara. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#import "SWOperationManger.h"

@interface SWOperationManger()

@property(nonatomic, copy) void (^uploadProgressBlock)(long long bytes, long long totalBytes, long long totalBytesExpected);

@property(nonatomic, copy) void (^downloadProgressBlock)(long long bytes, long long totalBytes, long long totalBytesExpected);

@end

@implementation SWOperationManger

-(id)init{
    
    self = [super init];
    self.operationQueue = [[NSOperationQueue alloc]init];
    
    return self;
}

- (void)addOperationWithBlock:(void (^)(void))block NS_AVAILABLE(10_6, 4_0){
    [self.operationQueue addOperationWithBlock:block];
}

-(NSArray *)getOperations{
    return  self.operationQueue.operations;
}

-(NSInteger)getOperationCount{
    return self.operationQueue.operationCount;
}

-(void)setMaxOperationCount:(NSInteger )count{
    self.operationQueue.maxConcurrentOperationCount = count;
}

@end
