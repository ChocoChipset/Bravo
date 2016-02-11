Bravo
=====

Bravo is an Objective-C library to simplify the extraction of metadata from JPEG files. 
It gathers Exif, IPTC, JFIF and TIFF properties and places them into a single ```NSDictionary``` object.


Usage
-----

1. [Install using CocoaPods](http://cocoadocs.org/docsets/Bravo/) or by adding the files under the ```/Source``` directory to your target.

2. To retrieve the metadata of an image, extract said image to a ```NSData``` object and use the method ```-extractMetadataFromJPEG:``` on it:

    ```obj-c
    NSDictionary *metadataProperties = [[BRavoExifManager sharedManager] extractMetadataFromJPEG:imageData];
    ```

3. Discover the plethora of information that can be retrieved from a single JPEG file.


Contribution
------------

Contribution is always welcomed. Send a pull-request or raise an issue. ;)


Authors
-------

Hector Zarate ([@hecktorzr](http://twitter.com/hecktorzr))


License
-------

Available under the MIT License.
