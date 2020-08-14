Import-Csv C:\createbulkuser.csv |

Foreach-Object {
$fullname = $_.Fullname
$description = $_.Description
  net /add user $_.Username $_.Password /fullname:$fullname /comment:$description
  net localgroup $_.GroupName $_.Username /add

}
  net localgroup ADMIN vc_ceo /add
  net localgroup ADMIN vc_hr_minh /add
  net localgroup ADMIN vc_marketer /add