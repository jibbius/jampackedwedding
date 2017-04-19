#!/usr/bin/env bash

# Before running this script, I:
# - Created a set of .jpgs (i.e. 800x480):
#     Photo group 1:
#         2017-04-15_14-09-29_1.jpg
#         2017-04-15_14-09-29_2.jpg
#         2017-04-15_14-09-29_3.jpg
#     Photo group 2:
#         2017-04-15_14-10-15_1.jpg
#         2017-04-15_14-10-15_2.jpg
#         2017-04-15_14-10-15_3.jpg
# - Created thumbnail versions of each image (i.e. 200x120)

prev_filename_no_inc=""
for jpg_file in *.jpg;
do
    filename_no_ext="${jpg_file%.*}" # Example: 2017-04-15_15-07-08_1
    filename_no_inc="${filename_no_ext::${#filename_no_ext}-2}" # Example: 2017-04-15_15-07-08

    if [ prev_filename_no_inc != filename_no_inc ]; then
        GM convert -delay 100 ${filename_no_inc}*.jpg ${filename_no_inc}-before-compression.gif
        prev_filename_no_inc=filename_no_inc
        ./gifsicle --colors 256 --lossy=80 -O3 -o ${filename_no_inc}.gif ${filename_no_inc}-before-compression.gif
        rm ${filename_no_inc}-before-compression.gif
    fi
done