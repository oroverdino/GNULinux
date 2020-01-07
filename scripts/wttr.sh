main()
{
    local request="wttr.in/${1--31.82,-60.52}"
    [ "$(tput cols)" -lt 125 ] && request+='?n'
    curl -H "Accept-Language: ${LANG%_*}" --compressed "$request"
}

main
