from pprint import pprint

from QA_module import langchain_QA

if __name__ == '__main__':
    user_question = input("질문을 입력하세요: ")

    qa = langchain_QA()
    # init 하면서 k값 같이 설정 (EX. k=1이면 문서를 1개만 넘김)
    qa.init_chatOpenAI(k=1)

    # query = '비상사태하의범죄처벌에관한특별조치령 사건의 판결 알려줘'
    # query = '누범가중의 요건'
    # query = '소유권이전에 대한 판결 알려줘'
    result = qa.qa_run(user_question)
    print(f"question: {result['question']}")
    print(f"answer: {result['answer']}")
    print(f"첫번째 문서의 사건 번호: {result['context'][0].metadata['사건번호']}")

    """
    result 설명
    result['question'] = query
    result['answer'] = ChatGPT로부터 받아온 답변
    result['context'] = ChatGPT로 같이 넘긴 문서
    """


    #---------------------------------------------------------------------------
    # 문서만 검색 (GPT 사용 안하므로, 과금X)
    # 해당 k는 위 init_chatOpenAI의 k와 별개의 값.
    query = '소유권이전에 대한 판결이 뭐야?'
    result_document = qa.search_docunment(query,5)
    # 이쁘게 출력
    pprint(result_document)