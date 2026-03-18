## Vector DB Use Case

A normal keyword search would not be enough for this kind of system. In a long contract, the same meaning can be written in many different ways. For example, a lawyer may search for “termination clauses,” but the contract might use words like “ending the agreement” or “cancel the contract.” In that case, keyword search may not find all the useful parts because it mostly checks exact words.

A vector database is helpful because it can search by meaning, not only by matching words. It uses embeddings, which change text into numbers. These numbers help the system understand which texts are similar in meaning.

In this case, the contract can be divided into smaller parts, and each part can be stored as an embedding in the vector database. When the lawyer asks a question in simple English, that question is also converted into an embedding. Then the system compares it with the contract embeddings and finds the most relevant sections.

So, I would say keyword search alone is not enough for this task. It can still help for exact terms, but a vector database makes the search much better because it can understand similar meaning even when the wording is different. This helps lawyers save time and find the right contract clauses more easily.