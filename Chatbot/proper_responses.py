import random


R_INDIA = '''India, officially the Republic of India, is a country in South Asia. It is the 
        seventh-largest country by area; the most populous country with effect from June 2023; 
        and from the time of its independence in 1947, the world's most populous democracy.'''






def unknown():

    response = ['Could you rephrase that?', "...", "What does that mean ?, I don't understand what you are saying"][random.randint(0,2)]
    return response
