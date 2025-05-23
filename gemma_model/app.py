import os
from  flask import Flask , request , jsonify
from transformers import AutoTokenizer, AutoModelForCausalLM

os.environ['HF_TOKEN'] =  os.getenv('HF_TOKEN')
access_token = os.environ['HF_TOKEN'] 


tokenizer = AutoTokenizer.from_pretrained("google/gemma-2b")
model = AutoModelForCausalLM.from_pretrained("google/gemma-2b")

@app.route('/' , method=['GET'])

def index():
    return 'App is running'

@app.route('/ai', method=['POST'])

def generate():
    input_text = request.json['input']

    token = tokenizer(input_text ,return_tensors='pt')

    output = model.generate(input_ids = input['input_id'] , max_new_tokens =50)

    generate = tokenizer.decode(output[0] ,skip_special_tokens=True)

    return jsonify({'generate':generate})



if __name__ == 'main':
    app.run(debug=True)
