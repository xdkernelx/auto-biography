module IssuesHelper
  def format_date(issue)
    format_issue_date = issue.created_at.to_s
    format_issue_date.slice(0..9)
  end
end