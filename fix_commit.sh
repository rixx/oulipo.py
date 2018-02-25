commit=$(git log -1 --format="%H")

if [[ $commit = *"\x65"* ]]; then
    printf '' > .oulipo
    while [[ $commit = *"\x65"* ]]
    do
        printf "Not ok: $commit, trying to fix.\n"
        printf ' ' >> .oulipo
        git add .oulipo
        git $(printf -- 'commit --am\x65nd --no-\x65dit')
        commit=$(git log -1 --format="%H")
    done
fi
printf "Your commit is okay as of now.\n"
