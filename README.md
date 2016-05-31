# quexml-docker

Docker image for queXML based on tutum/apache-php


Usage
-----

To create the image `acspri/quexml`, run the following command from the checkout of this repository:

    docker build -t acspri/quexml .

Running the queXML docker image
------------------------------

Start the image, bind port 80 on all interfaces to your container:

    docker run -d -p 80:80 -v /location-of-images:/images acspri/quexml

Where /location-of-images is a directory on your local machine that contains images that you want
queXML to have access to when creating forms.

For example, you can refer to images in your queXML document like this:

    &lt;img src="file:///images/cats.jpg"/&gt;

Access queXML by visiting:

    http://localhost/
