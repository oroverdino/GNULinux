# Restore installation from a list package

## Backup the packages installed

1. get the list of installed packages
2. remove those where deinstalled
3. remove the installed column
4. save the list

```
# dpkg --get-selections | grep -v deinstall | awk '{print S1}' > package.lst
```

## Restore from package.lst

```
# aptitude install -y $(cat package.lst)
```

