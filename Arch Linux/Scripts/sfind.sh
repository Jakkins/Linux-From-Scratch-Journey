
# theunixschool.com/2012/07/find-command-15-examples-to-exclude.html
# number 5

sudo find / -name '.cache' -prune -o -name '.mozilla' -prune -o -print

# con -path '/.cache' non funziona
