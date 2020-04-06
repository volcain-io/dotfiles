alias exc='exercism'
alias exconfkey='exercism configure -k'
alias exconfdir='exercism configure -d'
alias exconfhost='exercism configure -u'
alias exconfapi='exercism configure -a'
alias helpexconf='exercism configure --help'
alias excsbm='exercism submit'
alias excftc='exercism fetch'
excws () {
    track="${1:-.}"
    exercise="${2:-.}"
    cd "$(exercism workspace)/$track/$exercise"
}
excdwn () {
    track="${1:-bash}"
    exercise="${2:-hello-world}"
    exercism download --track="$track" --exercise="$exercise"
}
