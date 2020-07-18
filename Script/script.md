
### Command line script

List files
```bash
for f in /lfs/sources/*.tar; do echo "$f"; done 
```

#### Copy & Paste

Extract tar
```bash
# run in /sources
for f in *.tar*
do
    if [[ $f =~ \.gz$ ]]; then
        tar -xzvf $f
    else
        tar -xvf $f
    fi
done
```

