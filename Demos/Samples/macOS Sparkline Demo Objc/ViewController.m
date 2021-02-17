//
//  ViewController.m
//  macOS Sparkline Demo Objc
//
//  Created by Darren Ford on 23/12/19.
//

#import "ViewController.h"

@import DSFSparkline;

@interface ViewController ()

@property (nonatomic, weak) IBOutlet DSFSparklineLineGraphView *lineGraph;
@property (nonatomic, strong) DSFSparklineDataSource* dataSource;

@property (weak) IBOutlet DSFSparklineBarGraphView* barGraph;
@property (nonatomic, strong) DSFSparklineDataSource* barDataSource;

@property (weak) IBOutlet DSFSparklineBarGraphView* centeredBarGraph;
@property (nonatomic, strong) DSFSparklineDataSource* centeredBarDataSource;

@property (weak) IBOutlet DSFSparklineDotGraphView *receiveGraph;
@property (nonatomic, strong) DSFSparklineDataSource* receiveDataSource;
@property (weak) IBOutlet DSFSparklineDotGraphView *sendGraph;
@property (nonatomic, strong) DSFSparklineDataSource* sendDataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	srand48(time(0));

	_dataSource = [[DSFSparklineDataSource alloc] init];
	_barDataSource = [[DSFSparklineDataSource alloc] init];
	_centeredBarDataSource = [[DSFSparklineDataSource alloc] init];
	_receiveDataSource = [[DSFSparklineDataSource alloc] init];
	_sendDataSource = [[DSFSparklineDataSource alloc] init];

	[[self lineGraph] setDataSource:[self dataSource]];
	[[self dataSource] setRangeWithLowerBound:-1.0 upperBound:1.0];
	[[self lineGraph] setZeroLineDashStyleString: @"3,3"];

	[[self barGraph] setDataSource:[self barDataSource]];
	[[self barDataSource] setRangeWithLowerBound:0.0 upperBound:1.0];
	[[self barDataSource] setZeroLineValue:0.2];
	[[self barDataSource] setWindowSize:30];

	id blue = [[NSColor blueColor] colorWithAlphaComponent:0.2];
	id high = [[DSFSparklineHighlightRangeDefinition alloc] initWithLowerBound:0.3
																						 upperBound:0.7
																					highlightColor:blue];
	[[self barGraph] setHighlightRangeDefinition:@[high]];

	[[self centeredBarGraph] setDataSource:[self centeredBarDataSource]];
	[[self centeredBarDataSource] setRangeWithLowerBound:-1.0 upperBound:1.0];
	//[[self centeredBarDataSource] setZeroLineValue:-0.2];
	[[self centeredBarDataSource] setWindowSize:22];

	[[self centeredBarDataSource] setWithValues:
	 @[@(0.0), @(0.1), @(0.2), @(0.3), @(0.4), @(0.5), @(0.6), @(0.7), @(0.8), @(0.9), @(1),
		@(0.0), @(-0.1), @(-0.2), @(-0.3), @(-0.4), @(-0.5), @(-0.6), @(-0.7), @(-0.8), @(-0.9), @(-1)]];

	[[self receiveGraph] setDataSource:[self receiveDataSource]];
	[[self receiveDataSource] setRangeWithLowerBound:0.0 upperBound:1.0];
	[[self sendGraph] setDataSource:[self sendDataSource]];
	[[self sendDataSource] setRangeWithLowerBound:0.0 upperBound:1.0];

	[self performUpdate];
}

- (void)performUpdate {
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

		CGFloat v1 = drand48();

		BOOL result = [[self dataSource] pushWithValue: (v1 * 2) - 1];
		result = [[self barDataSource] pushWithValue: v1];

//		v1 = drand48();
//		result = [[self centeredBarDataSource] pushWithValue:(v1 * 2) - 1];


		v1 = drand48();
		result = [[self receiveDataSource] pushWithValue:v1];
		v1 = drand48();
		result = [[self sendDataSource] pushWithValue:v1];

		[self performUpdate];
	});
}

- (void)setRepresentedObject:(id)representedObject {
	 [super setRepresentedObject:representedObject];

	 // Update the view, if already loaded.
}


@end