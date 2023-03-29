Setup p4merge as diff and merge tool for git on windows
---------------------------------------

Download and install p4merge from chocolatey

        cinst p4merge

Setup p4merge as git's diff and merge tool. To do this, edit your .gitconfig under c:\users\\[yourusername] and add the following lines:

          [merge]
            tool = p4merge
          [mergetool "p4merge"]
            cmd = p4merge "$BASE" "$LOCAL" "$REMOTE" "$MERGED"
            trustExitCode = false
          [diff]
            external = p4mergeDiff.bat
          [push]
          	default = simple

Create a p4mergeDiff bat file to handle diff which only requires 2 arguments, old and new files. Put this file in your p4merge install folder: C:\Program Files\Perforce\p4mergeDiff.bat

        p4merge "%2" "%5"
  
Now restart your powershell to ensure that all of the paths are available and do a git diff. Each changed file will open in sequence as you close the previous one.

For reference and instructions on linux, check the official documentation at : http://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration