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

## Familiarize (for VS Code)
After install, Copilot is 100% ready to go. Start coding to use Code completions or click the "Chat" icon on the Activity Bar to use Copilot Chat.

That's all!

## Use
### Code completion <!-- 5 min -->
<!--
Hit on:
- context (file name, existing code, etc.)
  - maybe mention what is used as context and what is not
- how to accept suggestions (tab)
- how to flip through suggestions
- encourages commenting
- show generating boiler plate
  - getters and setters etc.
-->

> [!NOTE]
> Although I don't always explicitly list it, there is an implied acceptance of Copilot's suggestions at the end of each step below.


#### point.py
1. Navigate to point.py
    > file name is part of the context Copilot uses!

##### class point
1. Start a new comment "# create a list of names..."
    > If the suggestions are wrong or I don't like them, just keep typing!
1. Add "# put list of names in a function" to your comment
    > The clearer and more descriptive I am, the more helpful Copilot can be!
1. Add "# randomly select a name"
    > Copilot draws on all information in our file to build its context, so it can infer what we want based on what we have already commented and coded. Remember, file name is part of context!
1. Accept all suggestions
    > Copilot expedites "boring" coding (repetitive, boilerplate tasks). This gives us more time for the tasks and coding we enjoy.
1. Run code
3
<!-- ##### from direction to development
1. write a new comment "unit test function to verify line.length == point.distance"
1. hit enter and press tab -->

### Copilot Chat <!-- 10 min -->
<!--
Hit on:
- how context differs from Code completions
  - include how once there are prev messages in a hat, those act as context too
- How to accept changes from chat
- /clear and the `+` button
- history of chats
- models drop down +  attach files
- slash commands, and @'s
-->
#### Generate
> Copilot works on more than just traditional code. Even with operational tasks and files, Copilot can help.

##### Infra as Code
1. Navigate to iac.tf
1. Ask Copilot chat to "write a terraform file that creates an ec2 and bootstraps a apache webserver"
    > In Copilot Chat, we have various options for how to accepts suggested code.

<!-- ##### .github/workflows/main.yml
1. create a file main.yml
1. ask copilot chat to "write me a starter github actions file" -->

#### @, # and / <!-- 5 min -->
##### \#
We can use `#` to reference files or selections. Essentially, determine what context to use to answer the question we are asking. Note: #web for web search.

1. Try this in chat: 
    - what is the latest version of Node.js?
1. then try this
    - #web what is the latest version of Node.js?

##### @
Called "participants". Use if you're looking to ask about a specific topic or domain. Example @docker. Copilot extensions can also provide more chat participants. Personally I don't use it much but it's there!

##### /
Short hand for common tasks in Copilot. So that I don't have to type out a full paragraph.
- `/tests` - writes tests
- `/explain` - explain code
- `/fix` - fix errors

## FAQ
1. How does GitHub Copilot Chat differ from ChatGPT?
    - GitHub Copilot Chat takes into consideration the context of your codebase and workspace, giving you more tailored solutions grounded in the code that you've already written. ChatGPT does not do this.

## Best Practices
- https://docs.github.com/en/copilot/using-github-copilot/best-practices-for-using-github-copilot  