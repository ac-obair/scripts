#!/usr/bin/env python

from __future__ import print_function
from glob import glob 
import csv 
import sys
import os
import json

class images(object):

    def __init__(self, web_images):
        """
        Must be initialised with the type of images you are looking for to
        determine the root path to search from

	Args:
	 Possible values that can be used to initialise this class are:

	 block-images
	 incoming-images
	 incoming-remote
	 staging-images
	 testing-images
	 usedcar-images
	 vehicle_defaults
	 vehicle_defaults_png
 	 web

        """
        self.web_images = web_images
        self.reg_paths_json = "reg_paths.json"
        self.reg_paths = "reg_paths.txt"

    def get_car_paths_by_reg(self, csv_file):

        """ 
        This method is deigned to get the paths to all images of a certain car model    

        Args:
            A csv file

        Returns:
            A json object
        """

        images = "/data/web-images/" + self.web_images + "/*"

        with open(csv_file, 'rb') as opened_csv_file:
            csv_reader = csv.reader(opened_csv_file)
            reg_paths = {}
            
            print("Please wait... searching", images)
            reg_plain_text_file = open(self.reg_paths, "w")
            for reg in csv_reader:
                for idx,reg_path in enumerate(glob(images)):
                    reg_basename = os.path.basename(reg_path)
                    if reg_basename in reg:
                        print(reg_paths, file=reg_plain_text_file)
                        reg_paths[reg_basename] = reg_path
                        #print("Count: {index}, registration: {registration}".format(index=idx, registration=reg_basename))
            json.dump(reg_paths, open(self.reg_paths_json, "w"))
            print("{0} paths returned from {1} and dumped to json file in this local directory".format(len(reg_paths.keys()), self.web_images))
           

if __name__ == '__main__':
    images(sys.argv[1]).get_car_paths_by_reg(sys.argv[2])
