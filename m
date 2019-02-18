Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: dma: axi-dmac: Split too large segments
From: Lars-Peter Clausen <lars@metafoo.de>
Message-Id: <430b3cea-ce62-b67b-bd49-09d599249153@metafoo.de>
Date: Mon, 18 Feb 2019 08:34:53 +0100
To: "Ardelean, Alexandru" <Alex.Ardelean@analog.com>, "lkp@intel.com" <lkp@intel.com>
Cc: "kbuild-all@01.org" <kbuild-all@01.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "vkoul@kernel.org" <vkoul@kernel.org>
List-ID: <dmaengine.vger.kernel.org>

T24gMi8xOC8xOSA4OjI4IEFNLCBBcmRlbGVhbiwgQWxleGFuZHJ1IHdyb3RlOgo+IE9uIFNhdCwg
MjAxOS0wMi0xNiBhdCAxNzowMyArMDgwMCwga2J1aWxkIHRlc3Qgcm9ib3Qgd3JvdGU6Cj4+Cj4g
Cj4gTXkgYmFkIGhlcmUuCj4gSSB0b29rIHRoaXMgcGF0Y2ggZnJvbSBvdXIga2VybmVsIHRyZWUg
YW5kIHNlbnQgaXQuCj4gSSBhc3N1bWVkIGl0IHdvcmtzLCBzaW5jZSBpdCB3b3JrcyBpbiBvdXIg
dHJlZS4KPiBJJ2xsIHRha2UgYSBsb29rIGFuZCBzZWUgYWJvdXQgdGhlIG9yZGVyIG9mIHBhdGNo
ZXMsIGFuZCB3aGljaCBvbmUocykKPiBuZWVkKHMpIHRvIGJlIHNlbnQgYmVmb3JlIHRoaXMgb25l
CgpodHRwczovL2dpdGh1Yi5jb20vYW5hbG9nZGV2aWNlc2luYy9saW51eC9jb21taXQvNDE0YTU1
NTg5NmIyYWJjYTM1MThjM2M4NzhmMjFlN2IxZWE5NTkwNCNkaWZmLWI1YjJmZDU0MzBiNGY5YWZm
MWFlOTdiYWU2MGRkNWM1CgpUaGF0IHBhdGNoIHdhcyBzZW50IHVwc3RyZWFtLCBub3Qgc3VyZSB3
aHkgaXQgd2FzIG5ldmVyIG1lcmdlZC4KCkJ1dCBpZiBuZWNlc3NhcnkgeW91IGNhbiBhbHNvIHJl
LXdyaXRlIHRoaXMgcGF0Y2ggdG8gbm90IHJlbHkgb24gdGhlCm90aGVyIG9uZS4K
