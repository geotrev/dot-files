# Aliases

alias amcm="git commit --amend --no-edit"
alias fopu="git push -f origin"
alias gpo="git push -u origin HEAD"
alias so="source ~/.zshrc"

# Helpers

# Update current branch, then copy the latest commit
# 
# Example:
# - $ git checkout feat/some-branch
# - $ cpc
function cpc() {
        git pull && git rev-parse HEAD | pbcopy
        echo "Copied commit to clipboard: $COMMIT_SHA_SHORT."
}

# Check out the target branch, then cherry pick a commit to it. Use with cpc.
# 
# Example:
# - $ git checkout feat/some-branch
# - $ cpc
# - $ cpt 1234567 feat/my-branch
function chpt() {
        if [ $# -eq 2 ]; then
                echo "Cherry-picking commit '$1' to branch '$2'..."
                git checkout $2 && git pull && git cherry-pick $1
                echo "Done: cherry-picked commit '${1}' to branch '${2}'."       
        else
                echo "Must provide both a commit and target branch name for cherry-pick."
        fi
}
