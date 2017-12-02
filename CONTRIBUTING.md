Hello and welcom to Vimmic's contributors !

# Contributing

If you'd like to contribute to Vimmic, you can use the usual github pull-request flow:

1. Fork the project
2. Make your editions, preferably in a separate branch.
3. Test the new behaviour
4. Issue a pull request with a description of your feature/bugfix

# Editing

Vimmic is aimed to be simple to use and to maintain. To achieve this goal we try to respect two rules.

1. Avoid conflict with an original Vim behaviour
2. Avoid creating a function specific to Vimmic.

We want the user to be able use native Vim functionalities without having to adapt to Vimmic first.
The same idea applies for developers.

# Tests

There is no unit tests yet. This may come in the futur. For now, we rely on your intergity.

# Commit

Vimmic tries to respect a template for commit. This is not required but strongly recommended.
The git template is the following:

```git
# Type(<scope>): <subject>                                                                                                                                                                          
                                                                                                                                                                                                
# <body> (let a blank line)                                                                                                                                                                                         

# <footer>                                                                                                                                                                                          
                                                                                                                                                                                                    
# --- COMMIT END ---                                                                                                                                                                                
# Type can be•                                                                                                                                                                                      
#    feat     (new feature)                                                                                                                                                                         
#    fix      (bug fix)                                                                                                                                                                             
#    refactor (refactoring production code)                                                                                                                                                         
#    style    (formatting, missing semi colons, etc; no code change)                                                                                                                                
#    docs     (changes to documentation)                                                                                                                                                            
#    test     (adding or refactoring tests; no production code change)                                                                                                                              
#    chore    (updating grunt tasks etc; no production code change)                                                                                                                                 
# --------------------                                                                                                                                                                              
# Remember to                                                                                                                                                                                       
#    Capitalize the subject line                                                                                                                                                                    
#    Use the imperative mood in the subject line                                                                                                                                                    
#    Do not end the subject line with a period                                                                                                                                                      
#    Separate subject from body with a blank line                                                                                                                                                   
#    Use the body to explain what and why vs. how                                                                                                                                                   
#    Can use multiple lines with "-" for bullet points in body                                                                                                                                      
# --------------------
```
