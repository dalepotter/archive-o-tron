#!/usr/bin/env bash

echo "Current directory: $(pwd)"

declare -A urls=(
  ["IATI_Dashboard_dev_Humanitarian"]="http://dev.dashboard.iatistandard.org/humanitarian.html"
  ["IATI_Dashboard_Humanitarian"]="http://dashboard.iatistandard.org/humanitarian.html"
  ["Grand_Bargain_Dashboard"]="http://46.101.46.6/dashboard"
)

#Then use them just like normal arrays. animals['key']='value' to set value, "${animals[@]}" expands the values, "${!animals[@]}" (notice the !) expands the keys. Don't forget to quote them:
echo "Found ${#urls[*]} pages to download..."

echo "Starting loop:"
for slug in "${!urls[@]}"; do
  echo "Processing $slug"
  output_dir=docs/
  seperator=_
  file_extension=.html
  output_filename=$output_dir$(date -u +"%Y-%m-%dT%H:%M:%SZ")$seperator$slug$file_extension
  echo "Downloading ${urls[$slug]}"
  echo "Saving as $output_filename"
  wget ${urls[$slug]} -O $output_filename
  echo "Finished $slug"; done

echo 'Completed loop'
