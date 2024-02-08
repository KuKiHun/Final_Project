import os
from langchain_core.runnables import RunnableParallel
from langchain_core.runnables import RunnablePassthrough
from langchain_openai import ChatOpenAI
from langchain_community.vectorstores.chroma import Chroma
from langchain_community.embeddings import HuggingFaceEmbeddings
from langchain_core.output_parsers import StrOutputParser
from langchain_core.prompts import ChatPromptTemplate
from chromaDB import localChroma
from dotenv import load_dotenv, find_dotenv

load_dotenv(find_dotenv(usecwd=True))
# 예시: 서버 주소와 포트 번호를 설정한 부분
server_address = "http://127.0.0.1"
server_port = 5000


class langchain_QA:
    def __init__(self):
        embedding_function = HuggingFaceEmbeddings(model_name="jhgan/ko-sroberta-multitask")

        local_chroma = localChroma()
        persistent_client = local_chroma.persistent_client
        collection_name = os.getenv("collection_name")
        langchain_chroma = Chroma(
            client=persistent_client,
            collection_name=collection_name,
            embedding_function=embedding_function,
        )
        print("There are", langchain_chroma._collection.count(), "in the collection")

        self.db = langchain_chroma
        self.rag_chain_with_source = None

    def init_chatOpenAI(self, k):
        # Retrieve and generate using the relevant snippets of the blog.
        retriever = self.db.as_retriever(search_kwargs={'k': k})
        llm = ChatOpenAI()
        # 초기 프롬프트: Answer the question based only on the following context
        template = """Answer the question based on the following context, but if there is no relevant information, answer on your own:
        {context}

        Question: {question}

        Answer in the following language: Korean
        """
        prompt = ChatPromptTemplate.from_template(template)

        def format_docs(docs):
            return "\n\n".join(doc.page_content for doc in docs)

        rag_chain_from_docs = (
                RunnablePassthrough.assign(context=(lambda x: format_docs(x["context"])))
                | prompt
                | llm
                | StrOutputParser()
        )

        self.rag_chain_with_source = RunnableParallel(
            {"context": retriever, "question": RunnablePassthrough()}
        ).assign(answer=rag_chain_from_docs)
        print(f"init_chatOpenAI, k={k}")

    def qa_run(self, query):
        import time
        start_time = time.time()
        result = self.rag_chain_with_source.invoke(query)
        end_time = time.time()
        print(f"rag_chain_with_source 함수 실행 시간: {end_time - start_time:.2f} 초")
        return result

    def search_docunment(self, query, k):
        result = self.db.similarity_search_with_score(query=query, k=k)
        return result
