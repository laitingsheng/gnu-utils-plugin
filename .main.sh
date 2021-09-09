function _wrap_gnu() {
    prefix=$1
    shift 1

    for command in $*
    do
        name="${prefix}${command}"
        alias ${name}="${name} --color=auto"
    done
}

case $OSTYPE in
    darwin*)
        export CLICOLOR=1

        alias ls='ls -G'

        _wrap_gnu g ls dir vdir grep egrep fgrep
        ;;
    linux*)
        _wrap_gnu '' ls dir vdir
        ;;
    *)
        echo "system-utils: cannot recognise the OS type (${OSTYPE:-unknown})" >&2
        echo "system-utils: nothing has been modified" >&2
        ;;
esac

_wrap_gnu '' grep egrep fgrep
