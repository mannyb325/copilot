# copilot

> [!NOTE]
> As with any GenAI, Copilot is non-deterministic. As such, results you get from Copilot may differ from what I demonstrate.

## Install (for VS Code)
1. Go to Extensions (on Activity Bar)
1. Search for `Copilot`
1. Install
    > You will get both the `Copilot` and `Copilot Chat` extensions installed
1. Using either the pop-up after install or the "Accounts" icon on the Activity Bar, sign into GitHub

Easy as that!

## Familiarize
After install, Copilot is 100% ready to go. Start coding to use inline completions or click the "Chat" icon on the Activity Bar to chat.

That's all!

## Use
> at some point show writing boilerplate like Colin did. In the point class, accept all the values and the getters, setters, etc.

What to show:

### Inline <!-- 5 min -->
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

### Chat <!-- 10 min -->
#### Explain
1. open server.rs
1. ask copilot chat what this file is doing
<!-- maybe show #file:server.rs here and show just highlighting and open windows -->
#### Improve
1. ask copilot chat it if there are any ways we can improve the code
<!-- maybe talk here about how being specific in our prompt will help give more accurate, reliable answers. the less vague our ask, the better -->
<!-- ex. how could I improve this file? I want to make this code run as efficiently as possible and I want to follow best practices -->
1. ask chat how to implement thread pools and accept changes
<!-- this is a good time to show the full overwrite, vs copy paste -->

#### Translate
1. ask copilot chat to turn our rust code into python

#### Brainstorm
1. ask copilot chat: if I'm looking to create a webserver in python, how should I go about it? should I be creating it from scratch like I'm doing here?
1. ask it about the differences between the different frameworks it suggests.
1. ask it which to use if I'm looking to run a simple blog server and I don't have much coding experience.

#### Secure
> Copilot can help identify and mitigate security vulnerabilities
1. navigate to sql.py
1. ask copilot chat to identify any security vulnerabilities it sees

#### Generate
##### .github/workflows/main.yml
> Copilot works on more than just traditional code. Even with operational tasks and files, Copilot can help.

1. create a file main.yml
1. ask copilot chat to "write me a starter github actions file"


### @, # and / <!-- 5 min -->

#### \#
We can use `#` to reference files or selections. Essentially, determine what context to use to answer the question we are asking. Note; #web for web search.

1. Try this in chat: 
    - #what is the latest version of Node.js?
1. then try this
    - #web what is the latest version of Node.js?

#### @
Called "participants". Use if you're looking to ask about a specific topic or domain. Example @docker. Copilot extensions can also provide more chat participants. Personally I don't use it much but it's there!

#### /
Short hand for common tasks in Copilot. So that I don't have to type out a full paragraph.
- `/tests` - writes tests
- `/explain` - explain code
- `/fix` - fix errors

## FAQ
1. How does GitHub Copilot Chat differ from ChatGPT?
  - GitHub Copilot chat takes into consideration the coxtext of your codebase and workspace, giveing you more tailored soltinos grounded in the code that you've already written. ChatGPT does not do this.

## Best Practices
https://docs.github.com/en/copilot/using-github-copilot/best-practices-for-using-github-copilot