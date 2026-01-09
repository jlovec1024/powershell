function ll {
  $items = Get-ChildItem -Force @args

  $items |
    Sort-Object @{Expression = { -not $_.PSIsContainer }; Ascending = $true }, @{Expression = { $_.Name }; Ascending = $true } |
    ForEach-Object {
      $isDir = $_.PSIsContainer
      $size = if ($isDir) { "" } else {
        $len = $_.Length
        if ($len -ge 1GB) { "{0:N1}G" -f ($len/1GB) }
        elseif ($len -ge 1MB) { "{0:N1}M" -f ($len/1MB) }
        elseif ($len -ge 1KB) { "{0:N1}K" -f ($len/1KB) }
        else { "$len" }
      }

      $name = $_.Name
      $isExe = -not $isDir -and $_.Extension -match '^\.(exe|bat|cmd|ps1|com)$'

      if ($isDir) {
        $name = "$($PSStyle.Foreground.BrightBlue)$name$($PSStyle.Reset)"
      } elseif ($isExe) {
        $name = "$($PSStyle.Foreground.BrightGreen)$name$($PSStyle.Reset)"
      }

      [PSCustomObject]@{
        Mode = $_.Mode
        Size = $size
        LastWriteTime = $_.LastWriteTime
        Name = $name
      }
    } |
    Format-Table Mode, Size, LastWriteTime, Name -AutoSize
}
