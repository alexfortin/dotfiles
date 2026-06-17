alias gr="./gradlew"
alias vim='nvim'
alias ll='ls -la'

deleteBranches() {
	local current_branch branch
	current_branch="$(git branch --show-current 2>/dev/null || true)"

	git branch --format='%(refname:short)' | while read -r branch; do
		[[ "$branch" == "master" || "$branch" == "main" || "$branch" == "$current_branch" ]] && continue
		git branch -D "$branch"
	done
}

