import asyncio
from os import environ
from unittest.mock import Mock

import google.auth.credentials
from google.cloud import firestore


def get_db() -> firestore.AsyncClient:
    if environ.get("FIRESTORE_EMULATOR_HOST"):
        print("Connecting to emulator")
        return firestore.AsyncClient(
            project="firestore-test",
            credentials=Mock(spec=google.auth.credentials.Credentials),
        )
    else:
        print("Connecting to live environment")
        return firestore.AsyncClient()


async def main():
    # Add a new document
    print("Creating document")
    doc_ref = db.collection(u'users').document(u'alovelace')
    await doc_ref.set({
        u'first': u'Ada',
        u'last': u'Lovelace',
        u'born': 1815
    })

    # Then query for documents
    print("Reading documents")
    users_ref = db.collection(u'users')

    async for doc in users_ref.stream():
        print(u'{} => {}'.format(doc.id, doc.to_dict()))


if __name__ == "__main__":
    db = get_db()
    asyncio.run(main())
