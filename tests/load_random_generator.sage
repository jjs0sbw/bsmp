# Basic Structural Modeling (J. N. Warfield) mathematics.
# Copyright (C) 2013, 2014  Joseph James Simpson
# 
# This program is free software: you can redistribute it and/or modify it 
# under the terms of the GNU General Public License as published by the 
# Free Software Foundation, either version 3 of the License, or 
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, 
# but WITHOUT ANY WARRANTY; without even the implied warranty of 
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
# See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License 
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


import random
import copy

# create global variables for input sage script and out files
# outfile directory structure... place some where your sage program can access
outfile = '/Users/jjs0sbw/Desktop/Projects/BSMP/sage_docs/sage_out/rcl_2.txt'



# empty swap list 
swap_element_ab = []

## Display license and open output file
## First function
def start_process():
    """
    Displays the GPL 3 license opens the output file for data
    """
    print "Start Process Begin ... "
    open_file()  ## Open output file and write data OK
    print "Start Process End ..."





## Need to create a function that creates the randomized input data set 
## and returns the known data set and the randomized sample input data
def random_input_creation(matrix_size):
    """
    Creates a randomized list of of cities.  This list is used to test
    the structuring process.  This function has three sub-functions:
    -- create input data lists
    -- create input sample data list
    """
    
    city_names_list_ab, city_number_list_ab, input_sample_data_list_ab = create_input_data_lists(matrix_size)
    
    input_sample_data_list_in = create_input_sample_data_list(input_sample_data_list_ab)
    
    #create return tuple
    input_matrix_sample_data = (input_sample_data_list_in)
    
    # return tuple
    return input_matrix_sample_data


# random input creation sub function two (ric 1)  
def create_input_data_lists(matrix_size):
    # print notice of actions 
    print 'The make input list function creates a list of city and number pairs.'
    print 'The list is then used to create the randomized input to the program.'
    
    # initialize array variables 
    input_list_ab = []
    city_names_list_ab = []
    city_number_list_ab = []
    
    # populate the array variables with data from returned tuple
    city_names_list_ab, city_number_list_ab, input_sample_data_list_ab = make_input_lists(matrix_size)
 
    # write list to file 
    input_list_ab_out(input_sample_data_list_ab) ## file_out OK
    
    input_data_lists = (city_names_list_ab, city_number_list_ab, input_sample_data_list_ab)

    return input_data_lists

# random input creation sub function three (ric 2)  
def create_input_sample_data_list(input_sample_data_list_ab):
    # print notice of action
    #print 'PROCESS INPUT LIST START: Create in_one_list....\n'
    print '\nThe ramdon sample input list is: '
    
    #create new array variable 
    input_list_in = []
    
    #populate new variable 
    input_sample_data_list_in = process_input_list(input_sample_data_list_ab)

	#write to file
    input_list_in_out(input_sample_data_list_in) ## file_out OK
    
    return input_sample_data_list_in
    
#create a known city order for test purposes
#create a randomized set of data to use as unknown data input for test purposes
def make_input_lists(matrix_size):
    """
    This function creates and returns a list of city and number pairs.
    The list is then used to create the randomized input to the program
    """
    #city name tages
    city_tags_ab = 'ABCDEFGHIJKLMNOPQRS' 
    
    #new variable lists   
    city_number = []
    city_name = []
	
	#create initial populated city name and number lists
	#for each list cell number in the range of 0 to matrix size minus one
    for z in range(0, int(matrix_size)):
    	#place the number in the city number cell
        city_number.append(z)
        
        #place the city name in the city name cell
        city_name.append(city_tags_ab[z])
        
    #print city number to out file        
    city_number_out(city_number) ## file_out OK
    
    #print city name to out file
    city_name_out(city_name) ## file_out OK
    
    
    #print city number to screen
    print 'City number list is: '
    print city_number

	#create new variables populated with random paired city data
    name_num_ab = random.sample(city_number,int(matrix_size))
    name_tag_ab_new = random.sample(city_name, int(matrix_size))
    
    #create data pairs
    name_pair_ab = zip(name_num_ab, name_tag_ab_new)
    
    #create city data pair dictionaries 
    dict_1_ab = dict(name_pair_ab)
    
    #create known pairs dictionary
    known_pairs_ab = dict((v,k) for k,v in dict_1_ab.iteritems())
    
    #print known pairs data to the screen
    print '\nThe known ordered set is: '
    print known_pairs_ab 
    print '\n'
    
    #print "The original order (unknown order) is: " 
    #for k,v in known_pairs_ab.iteritems():
    	#print k,v
    	
    print "\n Alphabetical Order is: "
    p_str("\n Alphabetical Order is: \n")
    for k in city_tags_ab:
    	p_str_out = str(k) + " - " + str(known_pairs_ab[k]) + " - " + str(city_tags_ab.index(k) + 1) + " \n"
    	p_str(p_str_out)
    	print p_str_out 	
    	
    inv_ko = {v:k for k,v in known_pairs_ab.items()}
    
    print "The inverse dict is: " 
    p_str("\n The inverse dict is: \n")
    for k,v in inv_ko.iteritems():
    	p_str_out_1 = str(k) + " - " + str(v) + "   " + str(k+1) + " - " + str(city_tags_ab.index(v)) + " \n"
        p_str(p_str_out_1)
    	print p_str_out_1
    	
  	#print the known pairs data to the out file
    known_pairs_ab_out(known_pairs_ab)  ## file_out OK
    
    

    #create known city order list
    known_order_ab = [[x,known_pairs_ab[x]] for x in name_tag_ab_new]
    
    #create random city data set 
    data_ab = random.sample(city_number,int(matrix_size))
    
    #create random city data set 
    #data_set_1_ab = [[x,random.sample(data_ab, int(matrix_size/3))] for x in data_ab]  ############
    data_set_1_ab = [[x,random.sample(data_ab, int(matrix_size))] for x in data_ab]

	#print random data set to out file
    data_set_1_ab_out(data_set_1_ab)  ## file_out OK 

	#create total list variable
    total_sample_data_list = []
    
    #for x in the range of zero (0) to matrix size 
    for x in range(0,int(matrix_size)): 
    	#create a new list variable
        list_sub = []
        
        #for num in the range of zero (0) to (matrix size)
        for num in range(0,5):   
            #list_sub = [] # moved list_sub  up to other loop
            #if the x and y coordinates are not equal to each other
            #create some test code to print out the data elements
            if( dict_1_ab[data_set_1_ab[x][0]] != dict_1_ab[data_set_1_ab[x][1][num]]):
            	#if the x element is less that the y element
            	#create test code to print out the elements being compared 
                flag_1 = dict_1_ab[data_set_1_ab[x][0]] < dict_1_ab[data_set_1_ab[x][1][num]]
                
                #append elements to the list sup list... 
                list_sub.append([flag_1, data_set_1_ab[x][0], data_set_1_ab[x][1][num],dict_1_ab[data_set_1_ab[x][0]],dict_1_ab[data_set_1_ab[x][1][num]]])

     	#create copy of the list_sub to return..
        total_sample_data_list.append(copy.deepcopy(list_sub))
	
	#print the total_list to the out file
    total_list_out(total_sample_data_list)  ## file_out OK
    
    #create return tuple
    lists_back = (city_name, city_number, total_sample_data_list)
    
    #return the tuple 
    return lists_back
    
    
    
#take the randomized list of city information and process the information to
#structure the cities and recreate the known city order
def process_input_list(input_list):
    print "input_list contents are: " + str(input_list) + " \n" 
    length_list = []
    for i in range (0,len(input_list)):
    	length_list.append(len(input_list[i]))
    	
    print "length_list is: " + str(length_list) + " \n" 
    #create and initialize length variables
    length_one = len(input_list)
    length_two = len(input_list[0])

	#print process input list action header to the out file
    process_input_list_out()  ## file_out OK
	
	#print length of the input list to out file
    length_inout_list_out(len(input_list))  ## file_out OK
    
	#print length of the first sub list the out file
    length_inout_list_out_0(len(input_list[0]))  ## file_out OK

	#create new list variable 
    in_one_list_ab = []
    
    #for x in the range of zero (0) to the length of list one
    #create some tests at print results to the screen
    for x in range(0,length_one):
    	#for y in the range of zero (0) to length two
        for y in range(0,len(input_list[x])):
        	#append the value of input list x,y to the in_one_list
            in_one_list_ab.append(input_list[x][y])
	
	#append the first, second and third values from the lists in list one to list two
    in_two_list = [in_one_list_ab[x][0:3] for x in range(len(in_one_list_ab))]

	#print in_two_list to the out file
    in_two_list_out(in_two_list)  ## file_out OK

	#create the correct variable order for the items in list three
    in_three_list = order_entry(in_two_list)

	#print list three to the out file
    in_three_list_out(in_three_list)  ## file_out OK

	#return list three
    return in_three_list    
    
#creates the proper order for the items in the input list
def order_entry(in_list):
	#create new list variable 
    out_list = []
    
    #for x in the range of zero (0) to the length of the in list minus one
    for x in range(len(in_list)):
    
    	#check to see if the first entry in the the word True
        if(in_list[x][0] == True):
        	# if True then entries in proper order
        	#append the second and third item in the sub list to the out list
            out_list.append(in_list[x][1:3])
            
        #if False entries need to be swapped    
        if(in_list[x][0] == False):
        	#create new list variable 
            new_cell = []
            
            #enter third entry first
            new_x = in_list[x][2]
            
            #append new_x to new cell
            new_cell.append(new_x)
            
            #enter second entry second
            new_y = in_list[x][1]
            
            #append new y to new cell
            new_cell.append(new_y)
            
            #append the swapped entry cell to the out list
            out_list.append(new_cell)
            
    #return the out list        
    return out_list
    
##########
###########

### start file section -- functions to print data to out file

def p_str(in_str): ## Open output file and write data
    #Place appropriate file path in next statement 
    f_out_ab = open(outfile, 'a')
    f_out_ab.write(in_str)
    f_out_ab.close() ## start_file header complete

#open out file and write start header -- keep this one
def open_file(): ## Open output file and write data
    #Place appropriate file path in next statement 
    f_out_ab = open(outfile, 'w')
    f_out_ab.write('##########################################    START PROCESS   ####\n')
    f_out_ab.write('####  START FILE ab: Open output file and write data          ####\n')
    f_out_ab.write('##################################################################\n\n')
    f_out_ab.close() ## start_file header complete


#open the out file and print in put list to file -- keep this one
def input_list_ab_out(input_list_ab):
    f_out_ab = open(outfile, 'a')
    f_out_ab.write('#######################################    INPUT LIST AB      ####\n')
    f_out_ab.write('#### INPUT LIST AB :  \n' + str(input_list_ab)+    '          ####\n')
    f_out_ab.write('##################################################################\n')
    f_out_ab.write('       \n')
    f_out_ab.close() ## list out complete

#open out file and print list input -- keep this one
def input_list_in_out(input_list_in):
    f_out_ab = open(outfile, 'a')
    f_out_ab.write('########################################    INPUT LIST IN     ####\n')
    f_out_ab.write('#### INPUT LIST IN :  \n' + str(input_list_in)+    '          ####\n')
    f_out_ab.write('##################################################################\n')
    f_out_ab.write('       \n')
    f_out_ab.close() ## list out complete

#open out file and print city number list -- keep this one
def city_number_out(city_number):
    f_out_ab = open(outfile, 'a')
    f_out_ab.write('##########################################   CITY NUMBER     #####\n')
    f_out_ab.write('#### CITY NUMBER IS :  \n' + str(city_number)+    '          ####\n')
    f_out_ab.write('##################################################################\n')
    f_out_ab.write('       \n')
    f_out_ab.close() ## city number out complete

#open out file and print city name list -- keep this one
def city_name_out(city_name):
    f_out_ab = open(outfile, 'a')
    f_out_ab.write('######################################    CITY NAME           ####\n')
    f_out_ab.write('#### CITY NAME IS :  \n' + str(city_name)+    '               ####\n')
    f_out_ab.write('##################################################################\n')
    f_out_ab.write('       \n')
    f_out_ab.close() ## city name out complete

#open out file and print known pairs  -- keep this one
def known_pairs_ab_out(known_pairs_ab):
    f_out_ab = open(outfile, 'a')
    f_out_ab.write('##########################   KNOWN PAIRS  (ORDERED STRUCTURE) ####\n')
    f_out_ab.write('#### KNOWN PAIRS ARE :  \n' + str(known_pairs_ab)+    '       ####\n')
    f_out_ab.write('##################################################################\n')
    f_out_ab.write('       \n')
    f_out_ab.close() ## known pairs out complete
  
#open out file and print data set 1 -- need better description of list -- keep this one
def data_set_1_ab_out(data_set_1_ab):
    f_out_ab = open(outfile, 'a')
    f_out_ab.write('##################################       DATA SET AB          ####\n')
    f_out_ab.write('#### DATA SET 1 AB IS :  \n' + str(data_set_1_ab)+    '       ####\n')
    f_out_ab.write('##################################################################\n')
    f_out_ab.write('       \n')
    f_out_ab.close() ## data set 1 out complete

#open out file and print total list -- need better description of list -- keep this one
def total_list_out(total_list):
    f_out_ab = open(outfile, 'a')
    f_out_ab.write('##################################          TOTAL LIST        ####\n')
    f_out_ab.write('#### TOTAL LIST IS :  \n' + str(total_list)+    '             ####\n')
    f_out_ab.write('##################################################################\n')
    f_out_ab.write('       \n')
    f_out_ab.close() ## total list out complete

#open out file and print header for list processing -- keep this one
def process_input_list_out():
    f_out_ab = open(outfile, 'a')
    f_out_ab.write('##################################      PROCESS INPUT LIST    ####\n')
    f_out_ab.write('####  PROCESS INPUT LIST START: Create in_one_list..          ####\n')
    f_out_ab.write('##################################################################\n')
    f_out_ab.write('       \n')
    f_out_ab.close() ## process input list out complete

#open out file and print length of input list -- keep this one
def length_inout_list_out(length):
    f_out_ab = open(outfile, 'a')
    f_out_ab.write('##################################################################\n')
    f_out_ab.write('#### LENGTH OF INPUT LIST IS :  \n' + str(length)+'  ####\n')
    f_out_ab.write('##################################################################\n')
    f_out_ab.write('       \n')
    f_out_ab.close() ## length input list out complete

#open out file and print length of sub list -- keep this one
def length_inout_list_out_0(length):
    f_out_ab = open(outfile, 'a')
    f_out_ab.write('##################################################################\n')
    f_out_ab.write('#### LENGTH OF INPUT LIST[0] IS :  \n' + str(length)+'  ####\n')
    f_out_ab.write('##################################################################\n')
    f_out_ab.write('       \n')
    f_out_ab.close() ## length input list [0] list out complete

#open out file and print in two list -- keep this one
def in_two_list_out(in_two_list):
    f_out_ab = open(outfile, 'a')
    f_out_ab.write('##################################################################\n')
    f_out_ab.write('#### IN TWO LIST IS :  \n' + str(in_two_list)+'  ####\n')
    f_out_ab.write('##################################################################\n')
    f_out_ab.write('       \n')
    f_out_ab.close() ## in two list out complete

#open out file and print in three list -- keep this one
def in_three_list_out(in_three_list):
    f_out_ab = open(outfile, 'a')
    f_out_ab.write('##################################################################\n')
    f_out_ab.write('#### IN THREE LIST IS :  \n' + str(in_three_list)+'  ####\n')
    f_out_ab.write('##################################################################\n')
    f_out_ab.write('       \n')
    f_out_ab.close() ## in three list out complete






