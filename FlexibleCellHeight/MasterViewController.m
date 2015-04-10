//
//  MasterViewController.m
//  FlexibleCellHeight
//
//  Created by Hoang Pham on 4/9/15.
//  Copyright (c) 2015 Hoang Pham. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "TextView.h"

@interface MasterViewController ()

@property NSMutableArray *objects;

@property NSArray *data;
@end

@implementation MasterViewController

- (void)awakeFromNib {
	[super awakeFromNib];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.navigationItem.leftBarButtonItem = self.editButtonItem;

	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
	self.navigationItem.rightBarButtonItem = addButton;
	
	_data = @[@"<h1>I Godspeed You!</h1> Black Emperor tornano in Europa il prossimo anno! A quattro anni dalle sue ultime ed esaltanti esibizioni live, lo storico collettivo canadese che ha composto alcune delle pietre miliari del post-rock e tanto ha segnato l'ascolto di molti a cavallo tra gli anni '90 e i '00, si imbarcherà ad aprile 2015 in un tour di un mese in Europa.",
						@"<h3>Nella sua sede in fase di ampliamento </h3>, la Fondazione Marconi presenta in contemporanea due mostre: una selezione di opere su carta di Giuseppe Uncini, eseguite tra il 1959 e il 1977 e un nucleo di dipinti inediti e di grande formato realizzati da Marcello Jori negli ultimi quattro anni, ispirati a Parigi e all'Île de la Grande Jatte.",
						@"<h1>Dieci stanze per dieci artisti</h1>: una grande retrospettiva fa il punto sull'arte italiana degli ultimi quindici anni attraverso le opere dei dieci artisti vincitori del Premio Furla, dai suoi esordi a oggi. In mostra materie antiche, moderne e postmoderne tra pittura, scultura, installazione, video, performance e disegni.",
						@"<h1>Dieci stanze per dieci artisti</h1>",
						@"<h2>La Sala Castellana del Castello Sforzesco di Milano ospita la mostra \"Splendori rinascimentali nelle corti dell'Italia settentrionale\"</h2>"];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
	if (!self.objects) {
		self.objects = [[NSMutableArray alloc] init];
	}

	int random =  (arc4random_uniform((int)_data.count));
	
	[_objects insertObject: _data[random] atIndex:0];
	
	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
	[self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([[segue identifier] isEqualToString:@"showDetail"]) {
	    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
	    NSDate *object = self.objects[indexPath.row];
	    [[segue destinationViewController] setDetailItem:object];
	}
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

	NSString *object = self.objects[indexPath.row];
	
	TextView *textView = (TextView *) [cell viewWithTag: TEXTVIEW_TAG];
	textView.body = object;
	
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row < _objects.count) {
		return [TextView viewHeightForBodyString: _objects[indexPath.row] constraintSize: CGSizeMake( self.tableView.bounds.size.width, 2000.0)] + 10;
	}
	return 40;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
	// Return NO if you do not want the specified item to be editable.
	return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (editingStyle == UITableViewCellEditingStyleDelete) {
	    [self.objects removeObjectAtIndex:indexPath.row];
	    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
	} else if (editingStyle == UITableViewCellEditingStyleInsert) {
	    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
	}
}

@end
