
enable_prolog() {
    addpathf PATH ~/opt/swipl/bin
    addpathf PKG_CONFIG_PATH ~/opt/swipl/share/pkgconfig
    addpathf MANPATH ~/opt/swipl/share/man
    addpathf LD_LIBRARY_PATH ~/opt/swipl/lib/swipl
}

disable_prolog() {
    removepath PATH ~/opt/swipl/bin
    removepath PKG_CONFIG_PATH ~/opt/swipl/share/pkgconfig
    removepath MANPATH ~/opt/swipl/share/man
    removepath LD_LIBRARY_PATH ~/opt/swipl/lib/swipl
}
