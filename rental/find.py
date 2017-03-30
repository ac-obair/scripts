#!/usr/bin/env python

from __future__ import print_function
from pprint import pprint as pp
from os import listdir
from collections import Counter
import sys

# acrental boxes
log_dir = "/etc/httpd/logs/"

def find(criteria):
    print("performing search for", criteria)

    for log_file in listdir(log_dir):
        with open(log_dir + log_file, "r") as opened_log:
            log_lines = opened_log.readlines()

        found = 0
        lines = []

        for idx,the_line in enumerate(log_lines):
            if criteria in the_line:
                found+=1
                lines.append(the_line)

        if found:
            print("\nin {} found {}".format(log_file, found))

            dates = []
            for word in lines:

                date = word.split()[3].split(':')[0].strip('[')
                dates.append(date)

            print(Counter(dates))

if __name__ == '__main__':
    if len(sys.argv) > 1:
        for arg in sys.argv[1:]:
            find(arg)
    else:
        print("provide search criteria(s) as argument(s)")

