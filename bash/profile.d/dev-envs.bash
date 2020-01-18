
for config in dev-envs/*.bash ; do
    . "$config"
done
unset -v config
