export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export TERM=xterm-256color

PS1='\[\e[0;32m\]\u\[\e[m\]$(parse_git_branch) \[\e[1;36m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[0;32m\]'
PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/jason.thompson/workspace/scripts

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# MacPorts Installer addition on 2015-06-17_at_22:35:36: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"


parse_git_branch() {

	    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

    }

#ssh tab complete
_complete_ssh_hosts ()


{
    COMPREPLY=()
     cur="${COMP_WORDS[COMP_CWORD]}"
     comp_ssh_hosts=`cat ~/.ssh/known_hosts | \
                    cut -f 1 -d ' ' | \
                    sed -e s/,.*//g | \
                    grep -v ^# | \
                    uniq | \
                    grep -v "\[" ;
             cat ~/.ssh/config | \
	            grep "^Host " | \
                    awk '{print $2}'
            `
     COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
     return 0
}
complete -F _complete_ssh_hosts ssh
