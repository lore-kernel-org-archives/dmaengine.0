Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,3/9] dmaengine: st_fdma: use dmaenginem_async_device_register to simplify the code
From: Huang Shijie <sjhuang@iluvatar.ai>
Message-Id: <20180806092252.GA5301@hsj-Precision-5520>
Date: Mon, 6 Aug 2018 17:22:59 +0800
To: Daniel Mack <daniel@zonque.org>
Cc: vkoul@kernel.org, dan.j.williams@intel.com, Zubair.Kakakhel@imgtec.com, haojian.zhuang@gmail.com, robert.jarzmik@free.fr, patrice.chotard@st.com, linus.walleij@linaro.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, Eugeniy.Paltsev@synopsys.com, colin.king@canonical.com, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-ID: <dmaengine.vger.kernel.org>

T24gTW9uLCBBdWcgMDYsIDIwMTggYXQgMTE6MDM6NTFBTSArMDIwMCwgRGFuaWVsIE1hY2sgd3Jv
dGU6Cj4gPiAtCXJldCA9IGRtYV9hc3luY19kZXZpY2VfcmVnaXN0ZXIoJmZkZXYtPmRtYV9kZXZp
Y2UpOwo+ID4gKwlyZXQgPSBkbWFlbmdpbmVtX2FzeW5jX2RldmljZV9yZWdpc3RlcigmZmRldi0+
ZG1hX2RldmljZSk7Cj4gPiAgIAlpZiAocmV0KSB7Cj4gPiAgIAkJZGV2X2VycigmcGRldi0+ZGV2
LAo+ID4gICAJCQkiRmFpbGVkIHRvIHJlZ2lzdGVyIERNQSBkZXZpY2UgKCVkKVxuIiwgcmV0KTsK
PiA+IEBAIC04NTIsNyArODUyLDYgQEAgc3RhdGljIGludCBzdF9mZG1hX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgIAlyZXR1cm4gMDsKPiA+ICAgZXJyX2RtYV9kZXY6
Cj4gPiAtCWRtYV9hc3luY19kZXZpY2VfdW5yZWdpc3RlcigmZmRldi0+ZG1hX2RldmljZSk7Cj4g
Cj4gSSBndWVzcyB0aGUganVtcCBsYWJlbCBjYW4gZ28gYXdheSB0b28/Clllcy4gCgpXZSBjYW4g
cmVtb3ZlIHRoZSBlcnJfZG1hX2RldiB0b28uCgpUaGFua3MKSHVhbmcgU2hpamllCi0tLQpUbyB1
bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAidW5zdWJzY3JpYmUgZG1h
ZW5naW5lIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVs
Lm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9y
ZG9tby1pbmZvLmh0bWwK
