<?php

$screen_width = $_POST["width"] - 32;
$width_sum = 0;
$output = "";

$dir = "./images";
$dh  = opendir($dir);
while (false !== ($filename = readdir($dh))) {
	if ($filename != "." && $filename != "..") {
		list($width, $height, $type, $attr) = getimagesize("images/$filename");
		$new_width = ($width*180)/$height;
		if (($width_sum+$new_width) <= $screen_width) {
			$files[] = array("images/$filename", $new_width);
			$width_sum+=$new_width;
		}
		else {
			$margin = ($screen_width - $width_sum) / (2*(count($files)-1));
			$margin = $margin."px";
			$width_sum = 0;
			$numFiles = count($files);
			for ($i = 0; $i < $numFiles; $i++) {
				if ($i == 0) {
					$output .= "<div style='display: inline; width: 80px;'><a href='' style='width: 80px;'><img src='".$files[$i][0]."' style='height: 180px; width: ".$files[$i][1]." margin-left: 8px; margin-right: $margin'></a></div>";
				}
				else if ($i == ($numFiles -1)) {
					$output .= "<img src='".$files[$i][0]."' width=".$files[$i][1]." style='margin-left: $margin; margin-right: 8px;'>";
				}
				else {
					$output .= "<img src='".$files[$i][0]."' width=".$files[$i][1]." style='margin-left: $margin; margin-right: $margin'>";
				}
			}
			unset($files);

			$files[] = array("images/$filename", $new_width);
			$width_sum+=$new_width;
		}
	}
}

			foreach ($files as &$value) {
				$output .= "<img src='$value[0]' height=180 width=$value[1] style='margin-left: 8px; margin-right: 8px;'>";
			}
			unset($files);
			
echo $output;

?>