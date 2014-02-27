

ZBConnectionDelegate is the main class for getting the buckets/events from Zenobase.

Use it like this:

    ZBConnectionDelegate *connection = [[ZBConnectionDelegate alloc] init    ];
    connection.delegate = self;
    [connection getBuckets];
    

If you are subscribed to the ZBConnectionProtocol, you'll get a message from

- (void)didReceiveJSON:(NSDictionary *)json

and the json dictionary will have whatever you ordered from the ZBConnectionDelegate you initialized.


    


Next:

ZBConnectionDelegate

error checking if there are no NSUSerDefault values for ID etc.