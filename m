Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: dma: coh901318: Fix a double-lock bug
From: Vinod Koul <vkoul@kernel.org>
Message-Id: <20181124143035.GJ3175@vkoul-mobl.Dlink>
Date: Sat, 24 Nov 2018 20:00:35 +0530
To: Jia-Ju Bai <baijiaju1990@gmail.com>
Cc: linus.walleij@linaro.org, dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <dmaengine.vger.kernel.org>

T24gMDYtMTEtMTgsIDExOjMzLCBKaWEtSnUgQmFpIHdyb3RlOgo+IFRoZSBmdW5jdGlvbiBjb2g5
MDEzMThfYWxsb2NfY2hhbl9yZXNvdXJjZXMoKSBjYWxscyBzcGluX2xvY2tfaXJxc2F2ZSgpIAo+
IGJlZm9yZSBjYWxsaW5nIGNvaDkwMTMxOF9jb25maWcoKS4KPiBCdXQgY29oOTAxMzE4X2NvbmZp
ZygpIGNhbGxzIHNwaW5fbG9ja19pcnFzYXZlKCkgYWdhaW4gaW4gaXRzCj4gZGVmaW5pdGlvbiwg
d2hpY2ggbWF5IGNhdXNlIGEgZG91YmxlLWxvY2sgYnVnLgo+IAo+IEJlY2F1c2UgY29oOTAxMzE4
X2NvbmZpZygpIGlzIG9ubHkgY2FsbGVkIGJ5Cj4gY29oOTAxMzE4X2FsbG9jX2NoYW5fcmVzb3Vy
Y2VzKCksIHRoZSBidWcgZml4IGlzIHRvIHJlbW92ZSB0aGUKPiBjYWxscyB0byBzcGluLWxvY2sg
YW5kIC11bmxvY2sgZnVuY3Rpb25zIGluIGNvaDkwMTMxOF9jb25maWcoKS4KCkFwcGxpZWQgYWZ0
ZXIgZml4aW5nIHN1YnN5c3RlbSB0YWcsIHRoYW5rcwo=
