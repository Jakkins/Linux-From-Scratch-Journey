https://rtorrent-docs.readthedocs.io/en/latest/cookbook.html

It depends on your configuration but if you have this:
```bash
## Instance layout (base paths)
method.insert = cfg.basedir,  private|const|string, (cat,"/home/USERNAME/rtorrent/")              
method.insert = cfg.download, private|const|string, (cat,(cfg.basedir),"download/")            
method.insert = cfg.logs,     private|const|string, (cat,(cfg.basedir),"log/")                 
method.insert = cfg.logfile,  private|const|string, (cat,(cfg.logs),"rtorrent-",(system.time),".log")
method.insert = cfg.session,  private|const|string, (cat,(cfg.basedir),".session/")            
method.insert = cfg.watch,    private|const|string, (cat,(cfg.basedir),"watch/")
```
First you need to modify this and put your username
```bash
method.insert = cfg.basedir,  private|const|string, (cat,"/home/USERNAME/rtorrent/") 
```
Then
```bash
cd ~
mkdir rtorrent
cd rtorrent/
mkdir download
mkdir log
mkdir .session
mkdir watch
```

## Key Bindings

```bash
# start download
Ctrl-s
# delete torrent
Ctrl-d
```
