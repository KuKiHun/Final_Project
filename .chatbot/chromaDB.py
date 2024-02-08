import uuid
import chromadb
from datetime import datetime


class localChroma:
    def __init__(self):
        # cromadb 모듈의 PersistentClient 객체를 초기화
        self.persistent_client = chromadb.PersistentClient()
        self.collection = None
        self.embedding_function = None
        self.collection_name = None

    def init_collection(self, collection_name, embedding_function):
        self.collection = self.persistent_client.get_or_create_collection(name=collection_name)
        self.embedding_function = embedding_function
        self.collection_name = collection_name

    def get_count(self):
        try:
            print(f"Number of documents in {self.collection_name}: {self.collection.count()}")
        except Exception:
            print("Requires `init_collection` to be run.")

    #문서를 컬렉션에 추가,
    #문서의 객체를
    def collection_add(self, docs):
        # Assuming docs is a list of documents
        ids = [str(uuid.uuid4()) for _ in range(len(docs))]
        texts = [doc.page_content for doc in docs]
        metadatas = [doc.metadata for doc in docs]
        print(f"start collection_add: {self.collection_name}")
        print(f"start embeddings at {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
        # 임베딩
        embeddings = self.embedding_function.embed_documents(texts)
        print(f"finish embeddings at {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
        # 문서 add
        self.collection.add(embeddings=embeddings, documents=texts, metadatas=metadatas, ids=ids)
        print(f"finish collection_add at {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")

    def delete_collection(self, collection_name):
        try:
            self.persistent_client.delete_collection(collection_name)
            print(f"delete_collection: {collection_name}")
        except Exception as e:
            print(e)
