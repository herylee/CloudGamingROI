
in_path="./split"
if [ "$in_path" = "" ]; then
	echo "Input path is empty"
	exit 1
fi
echo "Input Path: $in_path"

ffmpeg -y -i $in_path/high-left.mp4 -i $in_path/low-right.mp4 -filter_complex \
"[0:v]pad=in_w*2:in_h[a]; \
 [1:v]pad[b]; \
 [a][b]overlay=w[out]" -map "[out]" ./pad/output.mp4

exit 0