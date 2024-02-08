import os
import pandas as pd
from langchain_community.embeddings import HuggingFaceEmbeddings
from langchain_core.documents import Document
from chromaDB import localChroma
from dotenv import load_dotenv, find_dotenv

load_dotenv(find_dotenv(usecwd=True))

if __name__ == '__main__':
    # .xlsx파일 경로
    excel_file_path = r"/Users/final_data/train_0.xlsx"
    # Read Excel file into a DataFrame
    df = pd.read_excel(excel_file_path)

    docs = []
    # df 전체 사용하기 전에, 꼭 적은 개수로 test 해볼 것.
    #for index, row in df.head(20).iterrows():
    for index, row in df.iterrows():
        d_json = {"사건명": row["사건명"], "판결요지": row["판결요지"]}
        doc = Document(page_content=str(d_json), metadata={'사건번호': row["사건번호"]})
        docs.append(doc)

    # --------------------------------------------------------------------------------------------

    # 바꾸지 말것
    embedding_function = HuggingFaceEmbeddings(model_name="jhgan/ko-sroberta-multitask")

    # .env 에서 collection 변수 바꿔도 됨.
    collection_name = os.getenv("collection_name")

    # local chroma. delete 랑 add 조심히 사용할 것.
    chroma = localChroma()
    # chroma.delete_collection(collection_name)
    chroma.init_collection(collection_name, embedding_function)
    # chroma.collection_add(docs)
    chroma.get_count()
