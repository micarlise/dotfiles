
for config in ${HOME}/.profile.d/dev-envs/*.bash ; do
    . "$config"
done
unset -v config
