# copilot

## Installation (for VS Code)
1. Go to Extensions (on Activity Bar)
1. Search for `Copilot`
1. Install
    > You will get both `Copilot` and `Copilot Chat`
1. Using either the pop-up after install or the "Accounts" icon on the Activity Bar, sign into GitHub
1. Done!

Easy as that!

## point.py
1. create a file called point.py

### class point
1. start a new comment "create a class"
    > If the suggestions are wrong or I don't like them, just keep typing!
1. tab (to autocomplete)
1. on the next line type "class Point:"
1. tab
    > GitHub Copilot draws on information from our workspace, so it is inferring what we want based on what we have already done and what it can see in other open files. in this case, file name is part of it.
1. write a new comment "tostring method"
1. hit enter and press tab
    > this is one of the smaller use cases for copilot but one of the most common and most effective. Removing boilerplate work, work that is needed but boring, repetitive and not "true coding"
1. start a new comment "calculate the"
1. tab
1. hit enter and press tab
    > this is again inferring that copilot is doing along with starting to showcase actual coding.

### from direction to development
1. write a new comment "unit test function to verify line.length == point.distance"
1. hit enter and press tab

### class line
1. start a new comment "create a class"
1. tab
1. on the next line type "class"
1. tab
    > copilot will essentially use all the workspace context, including code we've already written in this file, to determine how to generate new code. notice how copilot automatically added a tostring method (following a pattern it recognized from above) and it utilizes the distance method we defined automatically.

## new / complex code

1. open server.rs
1. ask copilot chat what this file is doing
1. ask copilot chat it if there are any ways we can improve the code
1. ask chat how to implement thread pools and accept changes





## .github/workflows/main.yml
> Copilot works on more than just traditional code. Even with operational tasks and files, Copilot can help.

1. create a file main.yml
1. ask copilot chat to "write me a starter github actions file"

## sql.py
> Copilot can help identify and mitigate security vulnerabilities

1. ask copilot chat to identify any security vulnerabilities it sees


## FAQ
1. How does GitHub Copilot Chat differ from ChatGPT?
  - GitHub Copilot chat takes into consideration the coxtext of your codebase and workspace, giveing you more tailored soltinos grounded in the code that you've already written. ChatGPT does not do this.