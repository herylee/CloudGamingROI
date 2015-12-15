# crop  w:h:x:y

input=$1
quality=$2
bitrate=$3

# if [[ ("$input" = "") || ("$quality" = "") || ("$bitrate" = "") ]]; then
if [ "$input" = "" ] || [ "$quality" = "" ] || [ "$bitrate" = "" ]; then
    echo "Params: filename + quality + bitrate"
    exit 1
fi

echo "----------------------"
echo " File:    $input"
echo " Quality: $quality"
echo " Bitrate: $bitrate"
echo "----------------------"

ffmpeg -y -i $input -b $bitrate -vf crop=in_w/2:in_h:0:0      ./split/$quality-left.mp4
ffmpeg -y -i $input -b $bitrate -vf crop=in_w/2:in_h:in_w/2:0 ./split/$quality-right.mp4

exit 0
