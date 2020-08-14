Import-Csv C:\createbulkgroup.csv |

Foreach-Object {
$description = $_.Description
  net /add localgroup $_.GroupName /comment:$description

}