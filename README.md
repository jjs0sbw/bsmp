bsmp
====

## Home of the Basic Structural Modeling Project

>The Basic Structural Modeling Project (BSMP) addressing the structural modeling activities developed by John N. Warfield and extended by Joseph Simpson and Mary Simpson.  The project is discussed, analyzed and developed in the context of three high level documents.  These high level documents are:

>1. Problem Definition Report (BSMP_PDR.pdf)
>2. Conceptual Solution Report (BSMP_CSR.pdf, BSMP_CSR_A.pdf)
>3. Detailed Design Report (Not Available yet -- In Work)

#### Problem Definition Report

>The BSMP Problem Definition Report provides a definition of the issues, concepts, tools and procedures used when structural modeling techniques are engaged to develop solutions to complex problems. 

#### Conceptual Solution Report

>The BSMP Conceptual Solution Report provides example concepts, tools, and procedures used to create solutions to structural modeling problems. This report examines solutions from the perspective of the selection of model types, the representation of the contextual structural relationship, and the techniques used to reflect applicable, appropriate mathematics. 

#### Detailed Design Report

>The BSMP Detailed Design Report provides an example design solution for the 19 cities problem.  This document is organized around the elements of an abstract relation type that contains the prose, graphics and mathematics necessary to clearly communicate the solution approach and context.

#### BSMP Web Application One

>The BSMP web application one (BWA1) is a basic web application focused on the 19 cities problem that is used to demonstrate the features and processes associated with basic structural modeling, structural integration modeling and interpretive structural modeling.  BWA1 is the first of a series of web applications that each focus on a specific structural modeling appraoch.  BWA1 focuses on ordering a set of 19 cities using the natural language relationship is "north-of."  Only one city can occupy any specific latitude whichs creates a strict subordination matrix.  After the application folder is downloaded, open the folder and click on the index.html file to open it with your defaul browser.  The application has been tested with Firefox and Chrome.

#### Tests 

>The rcl_2_2ul.txt  file contains the test data to validate and verify the web application methods.

>The load_random_generator.sage file contains the Sage math code to generate the random test data.

>The web_test_one_script file is a Firefox Selenium 2.4.0 test case script that runs the 19 city test case.
