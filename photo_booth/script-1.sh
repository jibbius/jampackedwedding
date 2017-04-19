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
# - Ran this command, looping over each thumbnail:
#     GM convert -delay 100 2017-04-15_14-09-29*.jpg 2017-04-15_14-09-29.gif
# - This created some small animated gifs, in the format:
#     2017-04-15_14-09-29.gif
# - I put all of the full size images, and animated gifs, (not the thumbnail jpgs),
#   in the same directory as this script
# - Ensure that the script is made executable:
#   `chmod +x script-1.sh`

for gif_file in *.gif;
do
    filename_no_ext="${gif_file%.*}"
    cat _header.html > $filename_no_ext.html
done

for jpg_file in *.jpg;
do
    filename_no_ext="${jpg_file%.*}" # Example: 2017-04-15_15-07-08_1
    filename_no_inc="${filename_no_ext::${#filename_no_ext}-2}" # Example: 2017-04-15_15-07-08
    echo "      <img src='${jpg_file}' height='480px' width='800px'></img>" >> $filename_no_inc.html
done


for gif_file in *.gif;
do
    filename_no_ext="${gif_file%.*}"
    cat _footer.html >>  $filename_no_ext.html
done