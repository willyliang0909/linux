#get log file within the last 24 hours from remote to local server
function getFile() {

	echo "Getting log file from $apm_host $apm_log_path"
	apm_logs=$(ssh $apm_user@$apm_host find $apm_log_path -name 'apm.*' -mtime 0 2>&1)

	if [ $? -ne 0 ]
	then
		echo "error: $apm_logs"
	  exit
	fi

	for file in $apm_logs
	do
			filename=${file##*/}
			echo $filename
			scp $apm_user@$apm_host:$file $local_path/$filename
	done
}
