Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: dma: coh901318: Fix a double-lock bug
From: Linus Walleij <linus.walleij@linaro.org>
Message-Id: <CACRpkdZRRqa6L9wws_5t7WC5Ekdx1NbWUbXdiM7rnHeZpb7Wrg@mail.gmail.com>
Date: Wed, 14 Nov 2018 14:36:55 +0100
To: baijiaju1990@gmail.com
Cc: vkoul@kernel.org, Dan Williams <dan.j.williams@intel.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, dmaengine@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <dmaengine.vger.kernel.org>

T24gVHVlLCBOb3YgNiwgMjAxOCBhdCA0OjMzIEFNIEppYS1KdSBCYWkgPGJhaWppYWp1MTk5MEBn
bWFpbC5jb20+IHdyb3RlOgoKPiBUaGUgZnVuY3Rpb24gY29oOTAxMzE4X2FsbG9jX2NoYW5fcmVz
b3VyY2VzKCkgY2FsbHMgc3Bpbl9sb2NrX2lycXNhdmUoKQo+IGJlZm9yZSBjYWxsaW5nIGNvaDkw
MTMxOF9jb25maWcoKS4KPiBCdXQgY29oOTAxMzE4X2NvbmZpZygpIGNhbGxzIHNwaW5fbG9ja19p
cnFzYXZlKCkgYWdhaW4gaW4gaXRzCj4gZGVmaW5pdGlvbiwgd2hpY2ggbWF5IGNhdXNlIGEgZG91
YmxlLWxvY2sgYnVnLgo+Cj4gQmVjYXVzZSBjb2g5MDEzMThfY29uZmlnKCkgaXMgb25seSBjYWxs
ZWQgYnkKPiBjb2g5MDEzMThfYWxsb2NfY2hhbl9yZXNvdXJjZXMoKSwgdGhlIGJ1ZyBmaXggaXMg
dG8gcmVtb3ZlIHRoZQo+IGNhbGxzIHRvIHNwaW4tbG9jayBhbmQgLXVubG9jayBmdW5jdGlvbnMg
aW4gY29oOTAxMzE4X2NvbmZpZygpLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmlhLUp1IEJhaSA8YmFp
amlhanUxOTkwQGdtYWlsLmNvbT4KClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53
YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpago=
