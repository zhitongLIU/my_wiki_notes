
repo = Rugged::Repository.new('.')
blame = Rugged::Blame.new(repo, 'concepts/pull_requests/reviewers.rb')
