from flask import Flask, render_template, request, jsonify, json
from pprint import pprint
from QA_module import langchain_QA
from flask_cors import CORS


app = Flask(__name__, template_folder='templates')
CORS(app)

# QA 모듈 초기화
qa = langchain_QA()
qa.init_chatOpenAI(k=1)

from flask import Flask, render_template, jsonify
from QA_module import langchain_QA

app = Flask(__name__, template_folder='templates')
qa = langchain_QA()
qa.init_chatOpenAI(k=1)

@app.route('/home')
def home():
    return render_template('index.html')

@app.route('/qa_request/<username>/<message_text>')
def qa_request(username, message_text):
    result = qa.qa_run(message_text)
    return jsonify({'question': result['question'], 'answer': result['answer']})


@app.route('/search_document/<keyword>/<k>')
def search_document(keyword, k):
    if '판례' in keyword:
        # '판례' 키워드가 포함된 경우
        result_document = qa.search_docunment(keyword, int(k))
        # 결과를 특정 형식으로 가공 (예: 판례의 '사건명'과 '판결요지'를 추출)
        formatted_results = []
        for index, row in result_document.iterrows():
            formatted_results.append({
                '사건명': row['사건명'],
                '판결요지': row['판결요지'],
                '사건번호': row['사건번호']  # 필요한 경우에 추가 필드도 포함할 수 있음
            })
        return jsonify({'result_document': formatted_results})
    else:
        # '판례' 키워드가 없는 경우에는 기존의 검색 결과를 그대로 전송
        result_document = qa.search_docunment(keyword, int(k))
        return jsonify({'result_document': result_document.to_dict(orient='records')})





if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000, debug=True)
