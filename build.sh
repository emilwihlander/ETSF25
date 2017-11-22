#!/bin/bash

# Function that silence warnings
function sil {
  $1 &>/dev/null
}

# 1. Fetches alias list
shopt -s expand_aliases
sil source ~/.bash_profiles
sil source ~/.bashrc

# Checks if 'gs' is set as alias
function git_status {
  echo -e "**********Git Status..."
  if alias gs &>/dev/null; then
    gs
  else
    git status
  fi
}

echo -e "**********Compiling to pdf...\n"
# 2. Compiles tex-files to pdf
pdflatex *.tex 1>/dev/null 
rm *.aux *.log
echo -e "\n**********Done compiling.\n"

# 3. Executes the function git_status
git_status

# 4. Adds the tex- and pdf-files 
git add *.tex *.pdf
echo -e "\n**********Added tex- and pdf-files to git.\n"

# 5. Executes the function git_status
git_status

# 6. Commit
# git commit
