## Vector DB Use Case

A normal keyword search would not be enough for this type of system. In a long contract, the same meaning can be written in many different ways. For example, a lawyer may search for “termination clauses,” but the contract may use words like “ending the agreement,” “cancel the contract,” or “right to exit.” In that case, keyword search may miss useful information because it mainly looks for exact words.

A vector database is helpful because it can search by meaning, not only by words. It uses embeddings, which convert text into numbers. These numbers help the system understand which pieces of text are similar in meaning.

In this system, the 500-page contracts can be divided into smaller sections or paragraphs. Then each part can be converted into an embedding and stored in the vector database. When the lawyer asks a question in plain English, that question is also converted into an embedding. The system then compares the question with the stored contract embeddings and finds the most relevant sections.

So, keyword search alone is not enough for this task. It can still help when the exact term is known, but it is limited. A vector database makes the search better because it can find related content even when the wording is different. This helps lawyers save time and find the right clauses more easily.