import re
import long_responses
import webbrowser

def message_prob(user_msg, recognized_words, single_response = False, required_words = []):
    message_certainty = 0
    has_required_words = True

    for word in user_msg:
        if word in recognized_words:
            message_certainty += 1
    
    percentage = float(message_certainty)/float(len(recognized_words))

    for word in required_words:
        if word not in user_msg:
            has_required_words = False
            break
    
    if has_required_words or single_response:
        return int(percentage*100)
    else: 
        return 0
    
def check_messages(msg):
    global highest_prob_list
    highest_prob_list = {}

    def response(bot_response, listofwords, single_response = False, required_words= []):
        #nonlocal highest_prob_list
        highest_prob_list[bot_response] = message_prob(msg, listofwords, single_response, required_words )
    
    # Responses-------------------------------------------------------------------------------------------
    response('Hello', ['hello','hi','hey'], single_response=True)
    response('I am doing fine, what about you? ', ['how', 'are', 'you', 'doing'], required_words=['how'])
    response('You\'re welcome!', ['thank', 'thanks'], single_response=True)
    response(proper_responses.R_INDIA, ['tell', 'me', 'something', 'about', 'india'], required_words=['about','india'])
    response("Alright, I'll open Google ", ["open", "google","go", "to"], required_words=["google"])
    response("Thank you for using me", ["bye", "cya", "quit"], single_response= True)


    #response()

    



    best_match = max(highest_prob_list, key=highest_prob_list.get)
    print(highest_prob_list)

    return proper_responses.unknown() if highest_prob_list[best_match] < 1 else best_match




def get_response(userinput):
    split_msg = re.split(r'\s+|[,.;?!-]\s*', userinput.lower())
    response = check_messages(split_msg)
    return response


openbrowser = False
bot_active = True

while bot_active:
    print('Bot: ' + get_response(input('You: ')))
    
    if highest_prob_list["Alright, I'll open Google "] > 0:
        openbrowser = True
    
    if openbrowser:
        webbrowser.open_new("https://google.com")
        openbrowser = False

    if highest_prob_list["Thank you for using me"] > 0:
        bot_active = False
