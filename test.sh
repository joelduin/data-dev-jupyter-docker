#! /bin/bash

while IFS="," read -r name yml_path requirements_path
do
  
  echo "name: $name"
  echo "yml_path: $yml_path"
  echo "requirements_path: $requirements_path"
  echo ""
  echo "${PWD}/${yml_path}"
  echo "${PWD}/${requirements_path}"
 
  echo ""

  sh conda env create -q -f "${PWD}/${yml_path}"

  
done < <(tail -n +2 environments/environment_list.csv)