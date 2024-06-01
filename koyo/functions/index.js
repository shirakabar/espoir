const functions = require("firebase-functions");

const admin = require("firebase-admin");
admin.initializeApp();

// Firebase cloudmessagingAPI legacyが使えなくなったのでsendTotopicは使えなくなりました
/* exports.sendnews = functions
    .firestore
    .document("news/{docId}")
    .onCreate((snap, context) => {
        const newValue = snap.data();
        const docId = context.params.docId;
        admin.messaging().sendToTopic("news", {
            notification: {
                title: docId,
                body: newValue["content"],
            },
        }, {
            priority: "high"
        });
        return 0;
    }); */

exports.sendnews = functions
    .region("asia-northeast1")
    .firestore
    .document("news/{docId}")
    .onCreate((snap, context) => {
      const newValue = snap.data();
      const docId = context.params.docId;
      const message = {
        notification: {
          title: docId,
          body: newValue["content"],
        },
        topic: "news",
      };
      return admin.messaging().send(message);
    });


exports.pushnotification = functions
    .https
    .onCall((data, context) => {
      const message = {
        notification: {
          title: "招集通知",
          body: `${data.text}に出場する選手は招集場所に集まってください`,
        },
        topic: "news",
        android: {
          priority: "high",
        },
        apns: {
          payload: {
            aps: {
              "content-available": 1,
              "apns-priority": "10",
            },
          },
        },
      };
      return admin.messaging().send(message);
    });
