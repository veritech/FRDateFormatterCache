FRDateFormatter
===============

Simple category on NSDateFormatter to offer methods to convert dates to and from string.

To convert a date into a string, you use the following

    NSString *string = [NSDateFormatter stringWithFormat:@"YYYY" date:[NSDate date]];
	
And if you wish to do the inverse

    NSDate *date = [NSDateFormatter dateWithFormat:@"YYYY" string:@"2015"]
	
The category will create a date formatter with the given format and keep it in an internal NSCache,
 reusing it whenever another operation is requested using the same method and format.
 
Formatters are shared between both methods. So in the examples above only one formatter would be created globally.

Get in Contact
---------------

[Twitter](http://twitter.com/veritech)
[Email](mailto:jonathan@float-right.co.uk)