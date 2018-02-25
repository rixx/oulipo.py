commit=$(git log -1 --format="%H")

if [[ $commit = *"e"* ]]; then
    printf '' > .oulipo
    while [[ $commit = *"e"* ]]
    do
        printf "Not ok: $commit, trying to fix.\n"
        printf ' ' >> .oulipo
        git add .oulipo
        git commit --amend --no-edit  # booh, git!
        commit=$(git log -1 --format="%H")
    done
fi
printf "Your commit is okay as of now.\n"
